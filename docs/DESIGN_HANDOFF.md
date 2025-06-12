# デザイン・開発ハンドオフガイド

このドキュメントでは、デザインから開発への効率的な引き渡し手順を説明します。

## 🎯 ハンドオフプロセス概要

```
Figmaデザイン → アセットエクスポート → Git管理 → Flutter実装
     ↓              ↓              ↓          ↓
   デザイナー    デザイナー/開発者    開発者     開発者
```

## 📋 チェックリスト

### 🎨 デザイナー側チェックリスト

#### デザイン完成時
- [ ] **デザインシステム準拠確認**
  - [ ] カラーパレットに準拠
  - [ ] タイポグラフィルールに準拠
  - [ ] スペーシングルールに準拠
  - [ ] コンポーネント統一性確認

- [ ] **レスポンシブ対応**
  - [ ] モバイル (375px) レイアウト確認
  - [ ] タブレット (768px) レイアウト確認
  - [ ] デスクトップ (1024px+) レイアウト確認

- [ ] **アクセシビリティ確認**
  - [ ] コントラスト比 4.5:1 以上
  - [ ] タッチターゲット 44dp 以上
  - [ ] フォントサイズ 12px 以上

- [ ] **アセット準備**
  - [ ] アイコン SVG エクスポート
  - [ ] 画像 PNG (2x) エクスポート
  - [ ] ワイヤーフレーム SVG エクスポート

#### Figmaファイル整理
- [ ] **バージョン管理**
  - [ ] ファイル名にバージョン番号追加
  - [ ] 変更履歴をコメントで記録
  - [ ] 古いバージョンをArchiveページに移動

- [ ] **命名規則統一**
  - [ ] レイヤー名: snake_case
  - [ ] コンポーネント名: PascalCase
  - [ ] カラースタイル名: kebab-case

- [ ] **開発者向け情報**
  - [ ] アニメーション仕様をコメントで記載
  - [ ] 状態変化パターンを説明
  - [ ] 特殊な実装要件をメモ

### 👨‍💻 開発者側チェックリスト

#### アセット受け取り時
- [ ] **ファイル確認**
  - [ ] SVGファイルの品質確認
  - [ ] 画像ファイルの解像度確認
  - [ ] ファイルサイズの最適化確認

- [ ] **Git管理**
  - [ ] `design/update-YYYYMMDD` ブランチ作成
  - [ ] アセットファイルを適切なディレクトリに配置
  - [ ] `DESIGN_CHANGELOG.md` 更新

#### 実装前確認
- [ ] **技術的実現性**
  - [ ] Flutter実装の実現可能性確認
  - [ ] パフォーマンス影響評価
  - [ ] ライブラリ依存関係確認

- [ ] **デザインシステム整合性**
  - [ ] 既存コンポーネントとの整合性
  - [ ] カラー・フォント定義の一致
  - [ ] アニメーション実装可能性

#### 実装完了時
- [ ] **品質確認**
  - [ ] デザインとの視覚的一致
  - [ ] レスポンシブ動作確認
  - [ ] アクセシビリティ要件達成

- [ ] **テスト実行**
  - [ ] ユニットテスト通過
  - [ ] ウィジェットテスト通過
  - [ ] Visual Regression Test 通過

## 📁 ファイル管理規則

### ディレクトリ構造
```
docs/
├── wireframes/
│   ├── v1.0/               # バージョン管理
│   ├── v1.1/
│   └── latest/             # 最新版へのリンク
├── design-assets/
│   ├── icons/              # SVGアイコン
│   ├── images/             # PNG画像
│   └── mockups/            # デザインモックアップ
├── design-specs/           # デザイン仕様書
└── DESIGN_CHANGELOG.md     # 変更履歴

lib/assets/                 # Flutterアセット
├── icons/                  # アプリ内使用アイコン
└── images/                 # アプリ内使用画像
```

### 命名規則

#### アセットファイル
```bash
# アイコン (SVG)
icon_[name]_[size].svg
例: icon_home_24.svg

# 画像 (PNG)
image_[name]_[variant]@2x.png
例: image_splash_hero@2x.png

# ワイヤーフレーム (SVG)
[screen_name]_wireframe.svg
例: home_screen_wireframe.svg
```

#### Git管理
```bash
# ブランチ名
design/update-YYYYMMDD
例: design/update-20241206

# コミットメッセージ
design: [変更内容の概要]
例: design: v1.1.0 ホーム画面レイアウト調整

# タグ名
design-vX.Y.Z
例: design-v1.1.0
```

## 🔄 バージョン管理戦略

### セマンティックバージョニング

```bash
vX.Y.Z
├─ X (Major): 大幅なデザイン変更、ブランド変更
├─ Y (Minor): 新画面追加、機能追加
└─ Z (Patch): 微調整、バグフィックス
```

### リリースサイクル
```
デザイン更新 → 開発実装 → テスト → リリース
    1週間       2週間      1週間    デプロイ
```

### ブランチ戦略
```
main
├─ develop                    # 開発ブランチ
│  ├─ feature/new-screen     # 新機能開発
│  └─ design/update-YYYYMMDD # デザイン更新
└─ release/vX.Y.Z            # リリース準備
```

## 🛠️ ツール活用

### Figma Plugin 推奨

#### Figma to Code
```javascript
// Flutter code generation
// Figma → Flutter Widget code
```

#### Design Tokens
```json
{
  "color": {
    "primary": {
      "value": "#009688",
      "type": "color"
    }
  },
  "spacing": {
    "md": {
      "value": "16px",
      "type": "spacing"
    }
  }
}
```

#### Version History
- 変更履歴の自動追跡
- バージョン間の差分確認

### VS Code Extension 推奨

#### Flutter Tools
- ホットリロード対応
- ウィジェット検査

#### GitLens
- Git履歴確認
- ブランチ比較

#### Material Design Icons
- Flutterアイコン検索

## 📊 品質保証

### デザイン実装検証

#### 自動テスト
```dart
// golden_toolkit を使用した視覚回帰テスト
testGoldens('HomeScreen should match design', (tester) async {
  await tester.pumpWidgetBuilder(
    HomeScreen(),
    surfaceSize: Size(375, 812),
  );
  
  await screenMatchesGolden(tester, 'home_screen');
});
```

#### 手動チェック
```markdown
### デザイン実装チェックリスト
- [ ] カラー正確性 (hex値確認)
- [ ] フォントサイズ・ウェイト一致
- [ ] 余白・パディング正確性
- [ ] 角丸・影の一致
- [ ] アニメーション仕様通り
- [ ] レスポンシブ対応
```

### パフォーマンス確認
```bash
# バンドルサイズ確認
flutter build apk --analyze-size

# メモリ使用量確認
flutter run --profile
```

## 🚀 自動化

### GitHub Actions

#### デザイン更新検知
```yaml
name: Design Update Detection
on:
  schedule:
    - cron: '0 9 * * MON'
  
jobs:
  check-figma-updates:
    # Figma API で最新バージョンチェック
    # 更新があれば Issue 作成
```

#### Visual Regression Test
```yaml
name: Visual Tests
on: pull_request

jobs:
  visual-tests:
    runs-on: ubuntu-latest
    steps:
      - name: Run Golden Tests
        run: flutter test --update-goldens
```

### 継続的デザイン統合 (CDI)
```
Figma更新 → 自動検知 → Issue作成 → PR作成 → 自動テスト → レビュー → マージ
```

## 💬 コミュニケーション

### 定期ミーティング

#### デザインレビュー (週1回)
```
- 前週の実装レビュー
- 今週のデザイン予定
- 技術的制約の相談
- 改善提案ディスカッション
```

#### スプリントプランニング (2週に1回)
```
- デザイン要件確認
- 実装工数見積もり
- 優先度調整
- リスク識別
```

### Slack連携

#### チャンネル構成
```
#design-dev-sync     # デザイン・開発連携
#design-updates      # デザイン更新通知
#implementation-help # 実装サポート
```

#### 通知設定
```
Figma更新 → #design-updates に自動通知
PR作成 → #design-dev-sync に通知
Issue作成 → 担当者にメンション
```

## 📈 メトリクス

### 効率性指標
- **ハンドオフ時間**: デザイン完成から実装開始まで
- **実装正確性**: デザインとの一致度
- **手戻り回数**: 修正要求の回数

### 品質指標
- **バグ発見率**: デザイン起因のバグ
- **パフォーマンス**: レンダリング速度
- **ユーザビリティ**: 実装後のユーザー満足度

## 🔍 トラブルシューティング

### よくある問題と解決法

#### デザインと実装の乖離
```
問題: 色が微妙に違う
解決: Figmaのhex値を正確にコピー

問題: フォントサイズが合わない
解決: line-height含めて確認

問題: レスポンシブで崩れる
解決: Figmaでブレークポイント確認
```

#### パフォーマンス問題
```
問題: 画像読み込みが遅い
解決: 適切なサイズで書き出し、WebP使用

問題: アニメーションがカクつく
解決: 60fps対応、GPU加速使用
```

#### Git管理問題
```
問題: バイナリファイルが肥大化
解決: Git LFS使用、定期的なクリーンアップ

問題: マージコンフリクト
解決: アセットファイルのパス統一
```

最終更新: 2024-12-06