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

## 🔄 ワイヤーフレーム更新

ワイヤーフレームを更新する場合：

1. **SVGファイル編集**
   - テキストエディタまたはSVG編集ツールで直接編集

2. **Figmaでの更新**
   - 更新されたSVGを再インポート
   - コンポーネントの更新

3. **バージョン管理**
   - 変更をGitで管理
   - 更新履歴をドキュメント化

## 📞 サポート

ワイヤーフレームに関する質問や改善提案：

1. [GitHub Issues](https://github.com/t-matzm0/travelet_flutter/issues)
2. 開発チームへの直接連絡

---

最終更新: 2024年12月