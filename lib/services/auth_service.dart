import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 現在のFirebaseユーザー
  User? get currentFirebaseUser => _auth.currentUser;

  // 認証状態のストリーム
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // アプリユーザーの取得
  Future<AppUser?> getCurrentUser() async {
    final firebaseUser = currentFirebaseUser;
    if (firebaseUser == null) return null;

    try {
      final doc = await _firestore
          .collection('users')
          .doc(firebaseUser.uid)
          .get();

      if (doc.exists) {
        return AppUser.fromJson(doc.data()!);
      } else {
        // Firestoreにユーザー情報がない場合、作成
        final newUser = AppUser(
          uid: firebaseUser.uid,
          email: firebaseUser.email ?? '',
          displayName: firebaseUser.displayName ?? '',
          photoURL: firebaseUser.photoURL,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        await _saveUserToFirestore(newUser);
        return newUser;
      }
    } catch (e) {
      print('Error getting current user: $e');
      return null;
    }
  }

  // メール/パスワードでユーザー登録
  Future<AppUser?> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String displayName,
  }) async {
    try {
      final UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final firebaseUser = result.user;
      if (firebaseUser == null) return null;

      // ディスプレイ名を設定
      await firebaseUser.updateDisplayName(displayName);

      // アプリユーザーを作成
      final appUser = AppUser(
        uid: firebaseUser.uid,
        email: email,
        displayName: displayName,
        photoURL: firebaseUser.photoURL,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      // Firestoreに保存
      await _saveUserToFirestore(appUser);

      return appUser;
    } on FirebaseAuthException catch (e) {
      print('Registration error: ${e.message}');
      throw _handleAuthError(e);
    } catch (e) {
      print('Unexpected registration error: $e');
      throw 'ユーザー登録中にエラーが発生しました。';
    }
  }

  // メール/パスワードでログイン
  Future<AppUser?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final firebaseUser = result.user;
      if (firebaseUser == null) return null;

      return await getCurrentUser();
    } on FirebaseAuthException catch (e) {
      print('Sign in error: ${e.message}');
      throw _handleAuthError(e);
    } catch (e) {
      print('Unexpected sign in error: $e');
      throw 'ログイン中にエラーが発生しました。';
    }
  }

  // ログアウト
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Sign out error: $e');
      throw 'ログアウト中にエラーが発生しました。';
    }
  }

  // パスワードリセット
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      print('Password reset error: ${e.message}');
      throw _handleAuthError(e);
    } catch (e) {
      print('Unexpected password reset error: $e');
      throw 'パスワードリセット中にエラーが発生しました。';
    }
  }

  // ユーザー情報の更新
  Future<AppUser?> updateUserProfile(AppUser user) async {
    try {
      final firebaseUser = currentFirebaseUser;
      if (firebaseUser == null) return null;

      // Firebase Authのプロフィール更新
      if (user.displayName != firebaseUser.displayName) {
        await firebaseUser.updateDisplayName(user.displayName);
      }

      if (user.photoURL != firebaseUser.photoURL) {
        await firebaseUser.updatePhotoURL(user.photoURL);
      }

      // Firestoreのユーザー情報更新
      final updatedUser = user.copyWith(updatedAt: DateTime.now());
      await _saveUserToFirestore(updatedUser);

      return updatedUser;
    } catch (e) {
      print('Error updating user profile: $e');
      throw 'プロフィールの更新中にエラーが発生しました。';
    }
  }

  // Firestoreにユーザー情報を保存
  Future<void> _saveUserToFirestore(AppUser user) async {
    await _firestore
        .collection('users')
        .doc(user.uid)
        .set(user.toJson());
  }

  // Firebase Authエラーのハンドリング
  String _handleAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return 'パスワードが弱すぎます。';
      case 'email-already-in-use':
        return 'このメールアドレスは既に使用されています。';
      case 'invalid-email':
        return 'メールアドレスの形式が正しくありません。';
      case 'user-not-found':
        return 'ユーザーが見つかりません。';
      case 'wrong-password':
        return 'パスワードが正しくありません。';
      case 'user-disabled':
        return 'このアカウントは無効化されています。';
      case 'too-many-requests':
        return '試行回数が多すぎます。しばらく待ってから再度お試しください。';
      default:
        return e.message ?? '認証エラーが発生しました。';
    }
  }
}