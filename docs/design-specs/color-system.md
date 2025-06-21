# カラーシステム仕様

Travelet Flutterアプリのカラーシステム定義です。

## 🎨 プライマリカラー

### Teal (主要色)
```css
--primary-900: #004D40;  /* ダーク */
--primary-800: #00695C;
--primary-700: #00796B;
--primary-600: #00897B;
--primary-500: #009688;  /* ベース */
--primary-400: #26A69A;
--primary-300: #4DB6AC;
--primary-200: #80CBC4;
--primary-100: #B2DFDB;
--primary-50:  #E0F2F1;  /* ライト */
```

### Cyan (セカンダリ)
```css
--secondary-500: #00BCD4;  /* ベース */
--secondary-400: #26C6DA;
--secondary-300: #4DD0E1;
--secondary-200: #80DEEA;
--secondary-100: #B2EBF2;
--secondary-50:  #E0F7FA;
```

## 🔴 アクセントカラー

### Red (いいね・エラー)
```css
--accent-red-500: #F44336;
--accent-red-400: #EF5350;
--accent-red-300: #E57373;
--accent-red-100: #FFCDD2;
--accent-red-50:  #FFEBEE;
```

### Amber (ブックマーク・警告)
```css
--accent-amber-500: #FFC107;
--accent-amber-400: #FFCA28;
--accent-amber-300: #FFD54F;
--accent-amber-100: #FFECB3;
--accent-amber-50:  #FFF8E1;
```

### Blue (情報・リンク)
```css
--accent-blue-500: #2196F3;
--accent-blue-400: #42A5F5;
--accent-blue-300: #64B5F6;
--accent-blue-100: #BBDEFB;
--accent-blue-50:  #E3F2FD;
```

### Green (成功・確認)
```css
--accent-green-500: #4CAF50;
--accent-green-400: #66BB6A;
--accent-green-300: #81C784;
--accent-green-100: #C8E6C9;
--accent-green-50:  #E8F5E8;
```

## ⚫ グレースケール

```css
--gray-900: #212121;  /* プライマリテキスト */
--gray-800: #424242;
--gray-700: #616161;
--gray-600: #757575;  /* セカンダリテキスト */
--gray-500: #9E9E9E;  /* ディサブルテキスト */
--gray-400: #BDBDBD;
--gray-300: #E0E0E0;  /* ボーダー */
--gray-200: #EEEEEE;
--gray-100: #F5F5F5;  /* サーフェス */
--gray-50:  #FAFAFA;
--white:    #FFFFFF;  /* 背景 */
```

## 🏷️ セマンティックカラー

### ステータス
```css
--status-success: var(--accent-green-500);
--status-warning: var(--accent-amber-500);
--status-error:   var(--accent-red-500);
--status-info:    var(--accent-blue-500);
```

### UI要素
```css
--bg-primary:   var(--white);
--bg-secondary: var(--gray-100);
--bg-tertiary:  var(--gray-50);

--text-primary:   var(--gray-900);
--text-secondary: var(--gray-600);
--text-disabled:  var(--gray-500);
--text-on-dark:   var(--white);

--border-light:  var(--gray-200);
--border-medium: var(--gray-300);
--border-strong: var(--gray-400);

--shadow-light:  rgba(0,0,0,0.05);
--shadow-medium: rgba(0,0,0,0.1);
--shadow-strong: rgba(0,0,0,0.15);
```

## 🌙 ダークモード (v1.2.0予定)

### プライマリ (ダーク)
```css
--dark-primary-500: #80CBC4;  /* Teal 200 */
--dark-secondary-500: #80DEEA; /* Cyan 200 */
```

### 背景 (ダーク)
```css
--dark-bg-primary:   #121212;
--dark-bg-secondary: #1E1E1E;
--dark-bg-tertiary:  #2D2D2D;

--dark-text-primary:   #FFFFFF;
--dark-text-secondary: #B3B3B3;
--dark-text-disabled:  #666666;
```

## 📱 Flutter実装

### colors.dart
```dart
class AppColors {
  // プライマリ
  static const Color primary = Color(0xFF009688);
  static const Color primaryLight = Color(0xFF00BCD4);
  static const Color primaryDark = Color(0xFF00796B);
  
  // アクセント
  static const Color accent = Color(0xFFF44336);
  static const Color warning = Color(0xFFFFC107);
  static const Color success = Color(0xFF4CAF50);
  static const Color info = Color(0xFF2196F3);
  
  // グレースケール
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color border = Color(0xFFE0E0E0);
  static const Color surface = Color(0xFFF5F5F5);
}
```

### theme.dart
```dart
final ThemeData lightTheme = ThemeData(
  colorSchemeSeed: AppColors.primary,
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primary,
    foregroundColor: Colors.white,
  ),
);
```

## 🎯 使用ガイドライン

### 主要色の使用
- **Primary Teal**: ナビゲーション、主要CTA、ブランド要素
- **Secondary Cyan**: グラデーション、アクセント、サブCTA
- **Red**: いいね、削除、エラー状態
- **Amber**: ブックマーク、警告、お気に入り
- **Blue**: リンク、情報、外部サイト
- **Green**: 成功、確認、完了状態

### コントラスト比
- **AA準拠**: 最低4.5:1 (通常テキスト)
- **AAA準拠**: 最低7:1 (重要テキスト)

### アクセシビリティ
- 色のみに依存しない情報伝達
- 十分なコントラスト比の確保
- カラーブラインドフレンドリー

最終更新: 2024-12-06