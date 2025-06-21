import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart';
import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  
  AppUser? _user;
  bool _isLoading = true;
  String? _error;

  // Getters
  AppUser? get user => _user;
  bool get isAuthenticated => _user != null;
  bool get isLoading => _isLoading;
  String? get error => _error;

  AuthProvider() {
    _initializeAuth();
  }

  // 認証状態の初期化
  void _initializeAuth() {
    _authService.authStateChanges.listen((User? firebaseUser) async {
      _setLoading(true);
      
      if (firebaseUser != null) {
        try {
          final appUser = await _authService.getCurrentUser();
          _setUser(appUser);
          _setError(null);
        } catch (e) {
          print('Error getting user data: $e');
          _setError('ユーザー情報の取得に失敗しました。');
          _setUser(null);
        }
      } else {
        _setUser(null);
        _setError(null);
      }
      
      _setLoading(false);
    });
  }

  // ユーザー登録
  Future<bool> register({
    required String email,
    required String password,
    required String displayName,
  }) async {
    try {
      _setLoading(true);
      _setError(null);
      
      final user = await _authService.registerWithEmailAndPassword(
        email: email,
        password: password,
        displayName: displayName,
      );
      
      if (user != null) {
        _setUser(user);
        return true;
      } else {
        _setError('ユーザー登録に失敗しました。');
        return false;
      }
    } catch (e) {
      _setError(e.toString());
      return false;
    } finally {
      _setLoading(false);
    }
  }

  // ログイン
  Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    try {
      _setLoading(true);
      _setError(null);
      
      final user = await _authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      if (user != null) {
        _setUser(user);
        return true;
      } else {
        _setError('ログインに失敗しました。');
        return false;
      }
    } catch (e) {
      _setError(e.toString());
      return false;
    } finally {
      _setLoading(false);
    }
  }

  // ログアウト
  Future<void> signOut() async {
    try {
      _setLoading(true);
      _setError(null);
      
      await _authService.signOut();
      _setUser(null);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  // パスワードリセット
  Future<bool> sendPasswordResetEmail(String email) async {
    try {
      _setLoading(true);
      _setError(null);
      
      await _authService.sendPasswordResetEmail(email);
      return true;
    } catch (e) {
      _setError(e.toString());
      return false;
    } finally {
      _setLoading(false);
    }
  }

  // プロフィール更新
  Future<bool> updateProfile(AppUser updatedUser) async {
    try {
      _setLoading(true);
      _setError(null);
      
      final user = await _authService.updateUserProfile(updatedUser);
      
      if (user != null) {
        _setUser(user);
        return true;
      } else {
        _setError('プロフィールの更新に失敗しました。');
        return false;
      }
    } catch (e) {
      _setError(e.toString());
      return false;
    } finally {
      _setLoading(false);
    }
  }

  // エラーをクリア
  void clearError() {
    _setError(null);
  }

  // Private setters
  void _setUser(AppUser? user) {
    _user = user;
    notifyListeners();
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String? error) {
    _error = error;
    notifyListeners();
  }
}