# Firebase Service Account設定手順

このドキュメントでは、GitHub ActionsでFirebase Hostingにデプロイするために必要なService Accountの設定手順を説明します。

## 📋 必要な作業

### 1. Firebase Service Accountキーの取得

1. **Firebase Consoleにアクセス**
   - URL: https://console.firebase.google.com/
   - プロジェクト: `travelet-app`を選択

2. **プロジェクト設定を開く**
   - 左メニューの歯車アイコン → 「プロジェクトの設定」

3. **サービスアカウントタブに移動**
   - 「サービスアカウント」タブをクリック
   - または直接: https://console.firebase.google.com/project/travelet-app/settings/serviceaccounts/adminsdk

4. **新しい秘密鍵を生成**
   - 「新しい秘密鍵を生成」ボタンをクリック
   - 確認ダイアログで「キーを生成」をクリック
   - JSONファイルが自動的にダウンロードされる
   - ファイル名: `travelet-app-XXXXX-firebase-adminsdk-XXXXX-XXXXXXXXXX.json`

### 2. GitHub Secretの設定

1. **GitHubリポジトリを開く**
   - https://github.com/t-matzm0/travelet_flutter

2. **Settings → Secrets and variables → Actions**
   - リポジトリのSettingsタブ
   - 左メニューから「Secrets and variables」→「Actions」

3. **New repository secretをクリック**

4. **以下の情報を入力**
   - **Name**: `FIREBASE_SERVICE_ACCOUNT_TRAVELET_APP`
   - **Secret**: ダウンロードしたJSONファイルの内容を**そのまま**貼り付け
   
   ⚠️ **重要**: base64エンコードは不要です。JSONをそのまま貼り付けてください。

5. **Add secretをクリック**

### 3. 設定確認

1. **Actions タブで確認**
   - リポジトリのActionsタブを開く
   - developブランチにプッシュ後、ワークフローが実行されることを確認

2. **Firebase Consoleで確認**
   - https://console.firebase.google.com/project/travelet-app/hosting
   - デプロイ履歴が表示されることを確認

## ⚠️ セキュリティ注意事項

1. **JSONファイルの取り扱い**
   - ダウンロードしたJSONファイルは機密情報です
   - Gitにコミットしない
   - 設定後は安全な場所に保管または削除

2. **権限の最小化**
   - Service Accountには必要最小限の権限のみ付与
   - Firebase Hosting Adminロールで十分

3. **定期的な更新**
   - セキュリティのため、定期的にキーを更新することを推奨

## 🔍 トラブルシューティング

### エラー: "Error: Missing permissions"
```
Error: Missing permissions for Firebase Hosting
```
**解決方法**: 
- Firebase ConsoleでService AccountにFirebase Hosting Admin権限を付与
- IAM & Admin → IAMで確認

### エラー: "Invalid service account"
```
Error: Invalid service account JSON
```
**解決方法**:
- JSONファイルが正しくコピーされているか確認
- 余分な空白や改行がないか確認
- JSONの構文エラーがないか確認

### エラー: "Project not found"
```
Error: Project travelet-app not found
```
**解決方法**:
- プロジェクトIDが正しいか確認
- Service AccountのプロジェクトIDと一致しているか確認

## 📞 サポート

設定で問題が発生した場合は、以下を確認してください：

1. [Firebase公式ドキュメント](https://firebase.google.com/docs/hosting/github-integration)
2. [GitHub Actions公式ドキュメント](https://docs.github.com/en/actions)
3. プロジェクトのIssues: https://github.com/t-matzm0/travelet_flutter/issues

最終更新: 2024-12-06