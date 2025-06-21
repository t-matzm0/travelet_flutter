# Firebase Hosting デプロイメントガイド

このドキュメントでは、Firebase Hostingを使用した自動デプロイ環境の設定方法を説明します。

## 🏗️ アーキテクチャ

```
develop branch → Firebase Preview Channel → 確認
     ↓                                        ↓
Pull Request                                 OK
     ↓                                        ↓
master branch → Firebase Production → 本番公開
```

## 📋 初期設定

### 1. Firebase Service Account作成

1. **Firebase Console**にアクセス
   ```
   https://console.firebase.google.com/project/travelet-app/settings/serviceaccounts/adminsdk
   ```

2. **新しい秘密鍵を生成**
   - 「新しい秘密鍵を生成」ボタンをクリック
   - JSONファイルがダウンロードされる

3. **GitHub Secretsに登録**
   ```bash
   # ダウンロードしたJSONファイルの内容をコピー
   cat ~/Downloads/travelet-app-*.json | base64
   ```

4. **GitHubリポジトリで設定**
   - Settings → Secrets and variables → Actions
   - 「New repository secret」をクリック
   - Name: `FIREBASE_SERVICE_ACCOUNT_TRAVELET_APP`
   - Value: 上記でコピーしたbase64文字列

### 2. ブランチ保護ルール設定

#### masterブランチ保護
1. **Settings → Branches**
2. **Add rule**をクリック
3. **Branch name pattern**: `master`
4. **保護設定**:
   - ✅ Require a pull request before merging
   - ✅ Require approvals (1)
   - ✅ Dismiss stale pull request approvals when new commits are pushed
   - ✅ Require status checks to pass before merging
     - `build_and_preview`を追加
   - ✅ Require branches to be up to date before merging
   - ✅ Include administrators

#### developブランチ保護（オプション）
1. **Branch name pattern**: `develop`
2. **保護設定**:
   - ✅ Require status checks to pass before merging
     - `flutter test`を追加

## 🚀 デプロイフロー

### 開発フロー

```bash
# 1. feature branchで開発
git checkout -b feature/new-feature
# ... 開発作業 ...

# 2. developブランチにPush
git add .
git commit -m "feat: 新機能追加"
git push origin feature/new-feature

# 3. GitHub上でPull Request作成
# develop ← feature/new-feature

# 4. 自動的にPreview URLが生成される
# 例: https://travelet-app--develop-pr123-abc123.web.app

# 5. レビュー & マージ
```

### 本番デプロイ

```bash
# 1. developからmasterへのPull Request作成
# GitHub上で「New pull request」
# base: master ← compare: develop

# 2. Preview環境で最終確認
# PR内のコメントにPreview URLが表示される

# 3. レビュー & マージ
# マージ後、自動的に本番環境にデプロイ

# 4. 本番URL
# https://travelet-app.web.app
# https://travelet-app.firebaseapp.com
```

## 🔗 環境URL

### Preview環境
- **URL形式**: `https://travelet-app--develop-{番号}-{ハッシュ}.web.app`
- **有効期限**: 7日間
- **用途**: 開発中の機能確認

### 本番環境
- **プライマリ**: https://travelet-app.web.app
- **セカンダリ**: https://travelet-app.firebaseapp.com
- **カスタムドメイン**: 設定可能

## 📊 環境変数

### 開発環境
```dart
// developブランチでは自動的に設定
const String ENVIRONMENT = 'development';
```

### 本番環境
```dart
// masterブランチでは自動的に設定
const String ENVIRONMENT = 'production';
```

### アプリ内での使用例
```dart
class Config {
  static const bool isProduction = bool.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: false,
  ) == 'production';
  
  static String get apiUrl => isProduction
    ? 'https://api.travelet.com'
    : 'https://dev-api.travelet.com';
}
```

## 🛠️ ローカルテスト

### Firebaseエミュレータ
```bash
# インストール
npm install -g firebase-tools

# エミュレータ起動
firebase emulators:start --only hosting

# ローカルURL: http://localhost:5000
```

### 手動デプロイ（緊急時）
```bash
# ビルド
flutter build web --release

# デプロイ
firebase deploy --only hosting

# Preview Channelへデプロイ
firebase hosting:channel:deploy preview-test --expires 1h
```

## 📝 トラブルシューティング

### よくあるエラー

#### 1. Service Account権限エラー
```
Error: Missing permissions for Firebase Hosting
```
**解決**: Service AccountにFirebase Hosting Admin権限を付与

#### 2. ビルドエラー
```
Error: Flutter build failed
```
**解決**: 
- `flutter clean && flutter pub get`
- Dart SDKバージョン確認

#### 3. デプロイ失敗
```
Error: Firebase deploy failed
```
**解決**:
- Firebase quotaチェック
- `firebase.json`設定確認

### デバッグコマンド
```bash
# Firebase設定確認
firebase projects:list

# Hosting設定確認
firebase hosting:sites:list

# チャンネル一覧
firebase hosting:channel:list

# ログ確認
firebase functions:log
```

## 🔒 セキュリティベストプラクティス

1. **Secret管理**
   - Service AccountキーをGitHubにコミットしない
   - GitHub Secretsで安全に管理

2. **ブランチ保護**
   - masterへの直接pushを禁止
   - レビュー必須設定

3. **環境分離**
   - 開発/本番でAPIキーを分離
   - 環境変数で制御

4. **アクセス制限**
   - Preview URLは期限付き（7日）
   - 必要に応じてIP制限追加可能

## 📈 モニタリング

### Firebase Console
- **Analytics**: https://console.firebase.google.com/project/travelet-app/analytics
- **Performance**: https://console.firebase.google.com/project/travelet-app/performance
- **Hosting**: https://console.firebase.google.com/project/travelet-app/hosting

### GitHub Actions
- **ワークフロー履歴**: リポジトリ → Actions タブ
- **デプロイ状況**: 各PRのChecksタブ

## 🎯 次のステップ

1. **カスタムドメイン設定**
   ```
   Firebase Console → Hosting → カスタムドメイン追加
   ```

2. **CDN設定**
   - CloudFlare統合
   - キャッシュ最適化

3. **A/Bテスト**
   - Firebase Remote Config
   - 段階的ロールアウト

最終更新: 2024-12-06