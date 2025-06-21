# Travelet Flutter ワイヤーフレームガイド

このドキュメントでは、Travelet Flutterアプリのワイヤーフレームについて説明します。

## 📁 ワイヤーフレームファイル

### SVGワイヤーフレーム

以下のSVGファイルがFigmaにインポート可能な形式で用意されています：

- `docs/wireframes/home_screen.svg` - ホーム画面
- `docs/wireframes/search_screen.svg` - 検索画面  
- `docs/wireframes/itinerary_list_screen.svg` - プラン一覧画面
- `docs/wireframes/spot_detail_screen.svg` - スポット詳細画面
- `docs/wireframes/profile_screen.svg` - プロフィール画面

### 🎨 Figmaへのインポート方法

1. **Figmaを開く**
   - [Figma](https://www.figma.com/)にアクセス
   - 新規ファイルを作成

2. **SVGファイルをインポート**
   ```
   File → Import → SVGファイルを選択
   ```

3. **複数ファイルの一括インポート**
   - 全てのSVGファイルを選択してドラッグ&ドロップ
   - または個別にインポート

## 📱 画面構成

### 1. ホーム画面 (home_screen.svg)

**主要要素：**
- ヘッダーグラデーション (#00BCD4 → #009688)
- ロゴ「travelet」
- キャッチコピー「どこへ行きたい？」
- 検索バー
- 人気プラン一覧 (3件表示)
- ボトムナビゲーション

**カラーパレット：**
- プライマリ: #009688 (Teal)
- セカンダリ: #00BCD4 (Cyan)
- 背景: #FFFFFF (White)
- テキスト: #212121 (Dark Gray)

### 2. 検索画面 (search_screen.svg)

**主要要素：**
- ヘッダー「検索」
- 検索バー（フォーカス状態）
- カテゴリーフィルター（全て、観光地、レストラン、ショッピング）
- 検索結果リスト
- スポット情報（名前、住所、カテゴリー、いいね数、ブックマーク数）

### 3. プラン一覧画面 (itinerary_list_screen.svg)

**主要要素：**
- ヘッダー「プラン」
- タブ切り替え（公開プラン、マイプラン）
- フィルター・並び替えボタン
- プランカード一覧
- プラン詳細（タイトル、説明、タグ、統計情報）
- FAB（プラン作成ボタン）

### 4. スポット詳細画面 (spot_detail_screen.svg)

**主要要素：**
- フルスクリーン画像
- 戻るボタン、メニューボタン、共有ボタン
- スポット名、住所
- カテゴリーバッジ
- 統計情報（いいね、ブックマーク、滞在時間、公式サイト）
- 説明文
- タグ一覧
- 地図表示エリア
- アクションボタン（プランに追加、ルート検索）

### 5. プロフィール画面 (profile_screen.svg)

**主要要素：**
- ヘッダーグラデーション
- プロフィール画像（ゲストアイコン）
- ユーザー名「ゲストユーザー」
- メニューリスト（お気に入り、閲覧履歴、設定）
- ログイン促進カード
- アカウント作成のメリット説明
- ログイン・新規登録ボタン

## 🎯 デザインシステム

### カラーパレット

```css
/* プライマリカラー */
--primary: #009688;        /* Teal 500 */
--primary-light: #00BCD4;  /* Cyan 500 */

/* セカンダリカラー */
--secondary: #F44336;      /* Red 500 - いいね */
--accent: #FFC107;         /* Amber 500 - ブックマーク */

/* ニュートラル */
--background: #FFFFFF;     /* White */
--surface: #F5F5F5;        /* Gray 100 */
--border: #E0E0E0;         /* Gray 300 */

/* テキスト */
--text-primary: #212121;   /* Gray 900 */
--text-secondary: #757575; /* Gray 600 */
--text-disabled: #9E9E9E;  /* Gray 500 */

/* タグカラー */
--tag-blue: #E3F2FD;       /* Blue 50 */
--tag-green: #E8F5E8;      /* Green 50 */
--tag-orange: #FFF3E0;     /* Orange 50 */
--tag-pink: #FCE4EC;       /* Pink 50 */
```

### タイポグラフィ

```css
/* ヘッダー */
--heading-large: 28px bold;
--heading-medium: 24px bold;
--heading-small: 20px bold;

/* ボディ */
--body-large: 16px regular;
--body-medium: 14px regular;
--body-small: 12px regular;

/* ラベル */
--label-medium: 14px medium;
--label-small: 12px medium;
```

### レイアウト

```css
/* 間隔 */
--spacing-xs: 4px;
--spacing-sm: 8px;
--spacing-md: 16px;
--spacing-lg: 24px;
--spacing-xl: 32px;

/* 角丸 */
--radius-sm: 4px;
--radius-md: 8px;
--radius-lg: 12px;
--radius-xl: 24px;

/* 影 */
--shadow-sm: 0 1px 2px rgba(0,0,0,0.05);
--shadow-md: 0 2px 4px rgba(0,0,0,0.1);
--shadow-lg: 0 4px 8px rgba(0,0,0,0.15);
```

## 📋 Figmaでの活用方法

### 1. コンポーネント作成

SVGから以下のコンポーネントを作成することを推奨：

- **BottomNavigation** - 各画面で共通使用
- **PlanCard** - プラン表示用
- **SpotCard** - スポット表示用  
- **SearchBar** - 検索機能用
- **TagChip** - カテゴリー・タグ表示用
- **ActionButton** - CTA用

### 2. デザインシステム構築

1. **カラースタイル設定**
   - 上記カラーパレットをFigmaのColor Stylesに設定

2. **テキストスタイル設定**
   - フォントサイズ・ウェイトをText Stylesに設定

3. **エフェクトスタイル設定**
   - 影・ぼかしをEffect Stylesに設定

### 3. レスポンシブ対応

- 375px幅（iPhone SE）をベースに作成
- iPad（768px）、Desktop（1024px）版も検討

## 🔄 デザイン・開発連携フロー

### Figma ↔ Git 連携戦略

このプロジェクトでは、デザインと開発の連携を効率化するため以下の方針を採用します：

#### 1. **デザインファイルの管理方針**

```
デザインソース: Figmaファイル (クラウド)
           ↓
         エクスポート
           ↓
   開発リポジトリ: SVG/PNG ファイル (Git管理)
           ↓
       Flutter実装: 実際のUI作成
```

#### 2. **ワークフロー詳細**

##### 🎨 デザイナー側のワークフロー

1. **Figmaでデザイン編集**
   ```
   Figmaファイル編集 → バージョン履歴に自動保存
   ```

2. **デザイン完成時のエクスポート**
   ```bash
   # 推奨エクスポート設定
   - SVG: ワイヤーフレーム・アイコン用
   - PNG (2x): 画像アセット用  
   - PDF: レビュー・共有用
   ```

3. **開発チームへの引き渡し**
   ```
   Figmaリンク共有 + エクスポートファイル提供
   ```

##### 👨‍💻 開発者側のワークフロー

1. **デザインアセットの更新**
   ```bash
   # 新しいデザインファイルを受け取ったら
   git checkout -b feature/design-update-YYYYMMDD
   
   # アセットファイルを配置
   cp new_design.svg docs/wireframes/
   cp new_icons/*.svg lib/assets/icons/
   cp new_images/*.png lib/assets/images/
   
   # コミット
   git add .
   git commit -m "design: デザインアセット更新 - YYYYMMDD版"
   ```

2. **Flutter実装への反映**
   ```bash
   # UIコンポーネントの更新
   # カラー・フォント・サイズ等をデザインに合わせて修正
   ```

#### 3. **ファイル構成と命名規則**

```
docs/
├── wireframes/           # ワイヤーフレーム (SVG)
│   ├── v1.0/            # バージョン別フォルダ
│   │   ├── home_screen.svg
│   │   └── search_screen.svg
│   └── latest/          # 最新版 (シンボリックリンクまたはコピー)
│       ├── home_screen.svg
│       └── search_screen.svg
├── design-assets/        # デザインアセット
│   ├── icons/           # アイコン (SVG)
│   ├── images/          # 画像 (PNG/JPG)
│   └── mockups/         # モックアップ (PNG)
└── design-specs/        # デザイン仕様書
    ├── color-system.md  # カラーシステム
    ├── typography.md    # タイポグラフィ
    └── components.md    # コンポーネント仕様
```

#### 4. **バージョン管理戦略**

##### デザインバージョニング

```bash
# セマンティックバージョニング採用
v1.0.0 - 初期リリース版
v1.1.0 - 機能追加
v1.0.1 - バグフィックス・微調整
```

##### Figmaでのバージョン管理

```
Figmaファイル名: travelet-app-design-v1.1.0
ページ構成:
  📱 Wireframes v1.1    # ワイヤーフレーム
  🎨 UI Components      # UIコンポーネント
  🎯 Design System      # デザインシステム
  📋 Archive           # 過去バージョン保管
```

#### 5. **具体的な連携手順**

##### 🔄 デザイン変更時のフロー

1. **デザイナーの作業**
   ```
   1. Figmaでデザイン修正
   2. バージョン番号を更新 (例: v1.1.0)
   3. 変更内容をFigmaコメントで記録
   4. 必要なアセットをエクスポート
   5. 開発チームに変更通知 (Slack/GitHub Issue)
   ```

2. **開発者の作業**
   ```bash
   # プルリクエスト作成
   git checkout -b design/update-v1.1.0
   
   # アセット更新
   mkdir -p docs/wireframes/v1.1.0
   cp figma-exports/*.svg docs/wireframes/v1.1.0/
   
   # 最新版リンク更新  
   rm -rf docs/wireframes/latest
   ln -s v1.1.0 docs/wireframes/latest
   
   # 変更履歴記録
   echo "## v1.1.0 - $(date)" >> docs/DESIGN_CHANGELOG.md
   echo "- ホーム画面のレイアウト調整" >> docs/DESIGN_CHANGELOG.md
   echo "- 検索バーのスタイル変更" >> docs/DESIGN_CHANGELOG.md
   
   git add .
   git commit -m "design: v1.1.0 デザインアセット更新"
   git push origin design/update-v1.1.0
   ```

3. **レビューとマージ**
   ```
   1. GitHub Pull Request作成
   2. デザインレビュー (before/after比較)
   3. 開発影響確認
   4. マージ後、実装作業開始
   ```

#### 6. **ツール連携の最適化**

##### GitHub Integration

```yaml
# .github/workflows/design-sync.yml
name: Design Asset Sync
on:
  schedule:
    - cron: '0 9 * * MON'  # 毎週月曜9時に自動チェック
  
jobs:
  check-figma-updates:
    runs-on: ubuntu-latest
    steps:
      - name: Check Figma Version
        # Figma API使用して最新バージョンチェック
      - name: Create Issue if Update Needed
        # 更新が必要な場合、自動でIssue作成
```

##### Figma Plugin活用

推奨プラグイン：
- **Figma to Code**: Flutter用コード生成
- **Design Tokens**: デザインシステム管理
- **Version History**: バージョン管理支援

#### 7. **コミュニケーションルール**

##### 定期同期ミーティング

```
頻度: 週1回 (30分)
参加者: デザイナー + フロントエンド開発者
アジェンダ:
  1. 前週の変更レビュー
  2. 今週の予定確認  
  3. 課題・改善点ディスカッション
```

##### 緊急時の連携

```
Slack: #design-dev-sync チャンネル
- 緊急デザイン変更
- 実装困難な仕様の相談
- アセット不備の報告
```

#### 8. **品質保証**

##### デザイン実装チェックリスト

```markdown
- [ ] カラーがデザインシステムに準拠
- [ ] フォントサイズ・行間が仕様通り
- [ ] 余白・角丸が正確に実装
- [ ] レスポンシブ対応が適切
- [ ] アニメーション仕様が反映
- [ ] アクセシビリティ要件を満たす
```

##### 自動化テスト

```bash
# Visual Regression Testing
npm run test:visual  # スクリーンショット比較
npm run test:design  # デザインシステム準拠チェック
```

## 🔄 ワイヤーフレーム更新手順

### 方法1: SVGファイル直接編集 (軽微な修正)

```bash
# SVGファイルを直接編集
vim docs/wireframes/latest/home_screen.svg

# 変更をコミット
git add docs/wireframes/latest/home_screen.svg
git commit -m "wireframe: ホーム画面の検索バー位置調整"
```

### 方法2: Figma経由更新 (大きな変更)

```bash
# 新バージョンフォルダ作成
mkdir docs/wireframes/v1.2.0

# Figmaからエクスポートしたファイルをコピー
cp ~/Downloads/figma-export/*.svg docs/wireframes/v1.2.0/

# 最新版リンク更新
rm docs/wireframes/latest
ln -s v1.2.0 docs/wireframes/latest

# 変更履歴更新
echo "## v1.2.0 - $(date)" >> docs/DESIGN_CHANGELOG.md

git add .
git commit -m "wireframe: v1.2.0 デザイン大幅更新"
```

## 📞 サポート

ワイヤーフレームに関する質問や改善提案：

1. [GitHub Issues](https://github.com/t-matzm0/travelet_flutter/issues)
2. 開発チームへの直接連絡

---

最終更新: 2024年12月