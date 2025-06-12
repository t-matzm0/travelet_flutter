# タイポグラフィ仕様

Travelet Flutterアプリのフォント・文字組み仕様です。

## 📝 フォントファミリー

### プラットフォーム別フォント

#### Web
```css
font-family: 'Noto Sans JP', 'Hiragino Sans', 'Yu Gothic UI', 'Yu Gothic', 'Meiryo', system-ui, -apple-system, sans-serif;
```

#### Windows
```css
font-family: 'Yu Gothic UI', 'Yu Gothic', 'Meiryo', 'Noto Sans JP', 'MS Gothic';
```

#### macOS
```css
font-family: 'Hiragino Sans', 'Hiragino Kaku Gothic ProN', 'Noto Sans JP', 'Yu Gothic';
```

#### Linux
```css
font-family: 'Noto Sans CJK JP', 'Noto Sans JP', 'IPAexGothic', 'IPAPGothic', 'Takao Gothic', 'VL PGothic', 'DejaVu Sans';
```

#### Android/iOS
```css
font-family: 'Noto Sans JP', 'Roboto', 'San Francisco';
```

## 📏 フォントサイズ・行間

### 見出し (Headings)

#### Display Large
```css
font-size: 57px;
line-height: 64px;
font-weight: 400;
letter-spacing: -0.25px;
```
**用途**: 特大見出し、ランディングページタイトル

#### Display Medium  
```css
font-size: 45px;
line-height: 52px;
font-weight: 400;
letter-spacing: 0px;
```
**用途**: 大きな見出し、セクションタイトル

#### Display Small
```css
font-size: 36px;
line-height: 44px;
font-weight: 400;
letter-spacing: 0px;
```
**用途**: 中程度の見出し

#### Headline Large
```css
font-size: 32px;
line-height: 40px;
font-weight: 400;
letter-spacing: 0px;
```
**用途**: ページタイトル、メインヘッダー

#### Headline Medium
```css
font-size: 28px;
line-height: 36px;
font-weight: 400;
letter-spacing: 0px;
```
**用途**: セクションヘッダー

#### Headline Small
```css
font-size: 24px;
line-height: 32px;
font-weight: 400;
letter-spacing: 0px;
```
**用途**: カードタイトル、サブヘッダー

### タイトル (Titles)

#### Title Large
```css
font-size: 22px;
line-height: 28px;
font-weight: 400;
letter-spacing: 0px;
```
**用途**: リストアイテムタイトル

#### Title Medium
```css
font-size: 16px;
line-height: 24px;
font-weight: 500;
letter-spacing: 0.15px;
```
**用途**: カードタイトル、ダイアログタイトル

#### Title Small
```css
font-size: 14px;
line-height: 20px;
font-weight: 500;
letter-spacing: 0.1px;
```
**用途**: 小見出し、サブタイトル

### ボディテキスト (Body)

#### Body Large
```css
font-size: 16px;
line-height: 24px;
font-weight: 400;
letter-spacing: 0.5px;
```
**用途**: 本文、説明文

#### Body Medium
```css
font-size: 14px;
line-height: 20px;
font-weight: 400;
letter-spacing: 0.25px;
```
**用途**: 標準テキスト、リスト項目

#### Body Small
```css
font-size: 12px;
line-height: 16px;
font-weight: 400;
letter-spacing: 0.4px;
```
**用途**: キャプション、補足情報

### ラベル (Labels)

#### Label Large
```css
font-size: 14px;
line-height: 20px;
font-weight: 500;
letter-spacing: 0.1px;
```
**用途**: ボタンラベル、重要ラベル

#### Label Medium
```css
font-size: 12px;
line-height: 16px;
font-weight: 500;
letter-spacing: 0.5px;
```
**用途**: タブラベル、チップラベル

#### Label Small
```css
font-size: 11px;
line-height: 16px;
font-weight: 500;
letter-spacing: 0.5px;
```
**用途**: 細かいラベル、バッジ

## 🎨 カラーとテキスト

### テキストカラー

#### Primary Text
```css
color: #212121;
opacity: 1.0;
```
**用途**: 主要テキスト、見出し

#### Secondary Text
```css
color: #757575;
opacity: 1.0;
```
**用途**: 説明文、サブテキスト

#### Disabled Text
```css
color: #9E9E9E;
opacity: 1.0;
```
**用途**: 無効化テキスト

#### Text on Dark
```css
color: #FFFFFF;
opacity: 1.0;
```
**用途**: ダーク背景上のテキスト

#### Text on Primary
```css
color: #FFFFFF;
opacity: 1.0;
```
**用途**: プライマリカラー背景上のテキスト

## 📱 Flutter実装

### text_styles.dart
```dart
class AppTextStyles {
  // 見出し
  static const TextStyle displayLarge = TextStyle(
    fontSize: 57,
    height: 64/57,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.25,
  );
  
  static const TextStyle headlineLarge = TextStyle(
    fontSize: 32,
    height: 40/32,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
  );
  
  static const TextStyle headlineMedium = TextStyle(
    fontSize: 28,
    height: 36/28,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
  );
  
  static const TextStyle headlineSmall = TextStyle(
    fontSize: 24,
    height: 32/24,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
  );
  
  // タイトル
  static const TextStyle titleLarge = TextStyle(
    fontSize: 22,
    height: 28/22,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
  );
  
  static const TextStyle titleMedium = TextStyle(
    fontSize: 16,
    height: 24/16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  );
  
  static const TextStyle titleSmall = TextStyle(
    fontSize: 14,
    height: 20/14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  );
  
  // ボディ
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    height: 24/16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  );
  
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    height: 20/14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );
  
  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    height: 16/12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  );
  
  // ラベル
  static const TextStyle labelLarge = TextStyle(
    fontSize: 14,
    height: 20/14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  );
  
  static const TextStyle labelMedium = TextStyle(
    fontSize: 12,
    height: 16/12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
  );
  
  static const TextStyle labelSmall = TextStyle(
    fontSize: 11,
    height: 16/11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
  );
}
```

### theme.dart での適用
```dart
final ThemeData lightTheme = ThemeData(
  fontFamilyFallback: _getFontFallback(),
  textTheme: const TextTheme(
    displayLarge: AppTextStyles.displayLarge,
    headlineLarge: AppTextStyles.headlineLarge,
    headlineMedium: AppTextStyles.headlineMedium,
    headlineSmall: AppTextStyles.headlineSmall,
    titleLarge: AppTextStyles.titleLarge,
    titleMedium: AppTextStyles.titleMedium,
    titleSmall: AppTextStyles.titleSmall,
    bodyLarge: AppTextStyles.bodyLarge,
    bodyMedium: AppTextStyles.bodyMedium,
    bodySmall: AppTextStyles.bodySmall,
    labelLarge: AppTextStyles.labelLarge,
    labelMedium: AppTextStyles.labelMedium,
    labelSmall: AppTextStyles.labelSmall,
  ),
);
```

## 📐 使用ガイドライン

### 階層構造
```
Display Large (57px)     # 最重要タイトル
├─ Headline Large (32px)  # ページタイトル
│  ├─ Title Large (22px)   # セクションタイトル
│  │  ├─ Title Medium (16px) # カードタイトル
│  │  └─ Body Large (16px)   # 本文
│  └─ Body Medium (14px)     # 標準テキスト
└─ Body Small (12px)        # 補足情報
```

### コンテキスト別使用例

#### ホーム画面
- **キャッチコピー**: Headline Large (28px bold)
- **セクションタイトル**: Title Medium (16px medium)
- **プランタイトル**: Title Medium (16px medium)
- **スポット名**: Body Medium (14px)
- **統計情報**: Body Small (12px)

#### 検索画面
- **画面タイトル**: Headline Small (20px bold)
- **カテゴリーラベル**: Label Medium (12px medium)
- **結果タイトル**: Title Medium (16px medium)
- **住所**: Body Small (12px)

#### 詳細画面
- **スポット名**: Headline Medium (24px bold)
- **住所**: Body Large (16px)
- **説明文**: Body Medium (14px)
- **タグ**: Label Small (10px medium)

### アクセシビリティ

#### 最小フォントサイズ
- **タッチターゲット**: 最低44dp
- **読みやすさ**: 最低12px
- **重要情報**: 最低14px

#### コントラスト
- **通常テキスト**: 4.5:1以上
- **大きなテキスト**: 3:1以上
- **重要テキスト**: 7:1以上

### レスポンシブ対応

#### モバイル (< 768px)
- 基本フォントサイズを使用

#### タブレット (768px - 1024px)
- フォントサイズを1.125倍に拡大

#### デスクトップ (> 1024px)
- フォントサイズを1.25倍に拡大

最終更新: 2024-12-06