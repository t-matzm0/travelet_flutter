# コンポーネント仕様

Travelet Flutterアプリの再利用可能UIコンポーネントの設計仕様です。

## 🧩 基本コンポーネント

### 1. BottomNavigation

#### 仕様
```dart
// 設定値
height: 84px
background: #FFFFFF
border-top: 1px solid #E0E0E0
safe-area: bottom

// アイテム設定
items: 4個
spacing: equal
active-color: #009688
inactive-color: #9E9E9E
```

#### 状態
- **Default**: グレーアイコン + グレーラベル
- **Active**: プライマリカラー背景 + 白アイコン + プライマリラベル
- **Pressed**: アルファ0.7

#### 使用例
```dart
NavigationBar(
  selectedIndex: _selectedIndex,
  onDestinationSelected: (index) => setState(() => _selectedIndex = index),
  destinations: const [
    NavigationDestination(icon: Icon(Icons.home_outlined), label: 'ホーム'),
    NavigationDestination(icon: Icon(Icons.search_outlined), label: '検索'),
    NavigationDestination(icon: Icon(Icons.route_outlined), label: 'プラン'),
    NavigationDestination(icon: Icon(Icons.person_outline), label: 'マイページ'),
  ],
)
```

### 2. SearchBar

#### 仕様
```dart
// サイズ
height: 48px
border-radius: 24px
horizontal-padding: 16px
vertical-padding: 12px

// スタイル
background: #F5F5F5 (default) / #FFFFFF (focused)
border: 1px solid #E0E0E0 (default) / 2px solid #009688 (focused)
shadow: 0 2px 10px rgba(0,0,0,0.05)
```

#### 状態
- **Default**: グレー背景、薄ボーダー
- **Focused**: 白背景、プライマリボーダー
- **Filled**: テキスト入力済み状態

#### 使用例
```dart
Container(
  height: 48,
  decoration: BoxDecoration(
    color: _isFocused ? Colors.white : Colors.grey[100],
    borderRadius: BorderRadius.circular(24),
    border: Border.all(
      color: _isFocused ? AppColors.primary : Colors.grey[300]!,
      width: _isFocused ? 2 : 1,
    ),
  ),
  child: TextField(
    decoration: InputDecoration(
      hintText: '場所、キーワード、所要時間で検索',
      prefixIcon: Icon(Icons.search),
      border: InputBorder.none,
    ),
  ),
)
```

### 3. PlanCard

#### 仕様
```dart
// サイズ
height: 100px (default) / 120px (detailed)
margin: horizontal 16px, vertical 8px
border-radius: 12px
elevation: 2

// レイアウト
image-size: 80x80px
image-border-radius: 8px
content-padding: 16px
```

#### 状態
- **Default**: 白背景、軽い影
- **Pressed**: アルファ0.9
- **Loading**: スケルトン表示

#### 使用例
```dart
Card(
  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  elevation: 2,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  child: InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(12),
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(imageUrl, width: 80, height: 80, fit: BoxFit.cover),
          ),
          SizedBox(width: 16),
          Expanded(child: /* コンテンツ */),
        ],
      ),
    ),
  ),
)
```

### 4. TagChip

#### 仕様
```dart
// サイズ
height: 24px (small) / 32px (medium)
border-radius: height / 2
horizontal-padding: 12px (small) / 16px (medium)

// カラーバリエーション
blue: background #E3F2FD, text #1976D2
green: background #E8F5E8, text #388E3C
orange: background #FFF3E0, text #F57C00
pink: background #FCE4EC, text #C2185B
gray: background #F5F5F5, text #757575
```

#### 使用例
```dart
Container(
  height: 24,
  padding: EdgeInsets.symmetric(horizontal: 12),
  decoration: BoxDecoration(
    color: _getBackgroundColor(type),
    borderRadius: BorderRadius.circular(12),
  ),
  child: Center(
    child: Text(
      label,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: _getTextColor(type),
      ),
    ),
  ),
)
```

### 5. ActionButton

#### 仕様
```dart
// プライマリボタン
height: 42px
border-radius: 21px
background: #009688
text-color: #FFFFFF
elevation: 2

// セカンダリボタン
height: 42px
border-radius: 21px
background: #FFFFFF
border: 1px solid #009688
text-color: #009688
```

#### 状態
- **Default**: 基本スタイル
- **Pressed**: アルファ0.9
- **Disabled**: グレーアウト
- **Loading**: スピナー表示

#### 使用例
```dart
ElevatedButton(
  onPressed: onPressed,
  style: ElevatedButton.styleFrom(
    backgroundColor: isPrimary ? AppColors.primary : Colors.white,
    foregroundColor: isPrimary ? Colors.white : AppColors.primary,
    side: isPrimary ? null : BorderSide(color: AppColors.primary),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
    minimumSize: Size(double.infinity, 42),
  ),
  child: Text(label),
)
```

## 📄 レイアウトコンポーネント

### 1. AppHeader

#### 仕様
```dart
// グラデーションヘッダー
height: 200px (expanded) / 100px (collapsed)
gradient: linear-gradient(135deg, #00BCD4 0%, #009688 100%)
text-color: #FFFFFF
safe-area: top
```

#### バリエーション
- **Home**: ロゴ + キャッチコピー
- **Search**: タイトルのみ
- **Profile**: プロフィール情報

### 2. ContentCard

#### 仕様
```dart
// 基本カード
border-radius: 12px
background: #FFFFFF
elevation: 1
padding: 16px
margin: 16px (horizontal), 8px (vertical)
```

#### バリエーション
- **SpotCard**: スポット情報表示
- **ItineraryCard**: 旅程情報表示
- **InfoCard**: 情報表示

### 3. StatRow

#### 仕様
```dart
// 統計情報行
height: 60px
background: #F5F5F5
border-radius: 8px
padding: 8px

// アイテム配置
items: 2-4個
spacing: equal
alignment: center
```

## 🎨 インタラクションパターン

### 1. タップフィードバック

#### Ripple Effect
```dart
InkWell(
  onTap: onTap,
  borderRadius: BorderRadius.circular(borderRadius),
  splashColor: AppColors.primary.withOpacity(0.1),
  highlightColor: AppColors.primary.withOpacity(0.05),
  child: child,
)
```

#### Scale Animation
```dart
GestureDetector(
  onTapDown: (_) => _controller.forward(),
  onTapUp: (_) => _controller.reverse(),
  onTapCancel: () => _controller.reverse(),
  child: ScaleTransition(
    scale: Tween(begin: 1.0, end: 0.95).animate(_controller),
    child: child,
  ),
)
```

### 2. ローディング状態

#### スケルトン
```dart
Shimmer.fromColors(
  baseColor: Colors.grey[300]!,
  highlightColor: Colors.grey[100]!,
  child: Container(
    height: height,
    decoration: BoxDecoration(
      color: Colors.grey[300],
      borderRadius: BorderRadius.circular(borderRadius),
    ),
  ),
)
```

#### スピナー
```dart
SizedBox(
  width: 20,
  height: 20,
  child: CircularProgressIndicator(
    strokeWidth: 2,
    valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
  ),
)
```

## 📏 スペーシングシステム

### グリッドシステム
```dart
// 基本間隔
static const double xs = 4.0;   // 最小間隔
static const double sm = 8.0;   // 小間隔
static const double md = 16.0;  // 標準間隔
static const double lg = 24.0;  // 大間隔
static const double xl = 32.0;  // 最大間隔

// コンテナ間隔
static const double containerMargin = 16.0;
static const double cardPadding = 16.0;
static const double sectionSpacing = 24.0;
```

### レスポンシブ間隔
```dart
double getResponsiveSpacing(BuildContext context, double baseSpacing) {
  final screenWidth = MediaQuery.of(context).size.width;
  if (screenWidth > 1024) {
    return baseSpacing * 1.5;  // デスクトップ
  } else if (screenWidth > 768) {
    return baseSpacing * 1.25; // タブレット
  }
  return baseSpacing; // モバイル
}
```

## 🔧 実装ガイドライン

### 1. コンポーネント作成原則

#### 単一責任原則
```dart
// ❌ 悪い例: 複数の責任を持つ
class ComplexCard extends StatelessWidget {
  // 表示ロジック + データ取得 + ナビゲーション
}

// ✅ 良い例: 表示のみに専念
class SpotCard extends StatelessWidget {
  final Spot spot;
  final VoidCallback? onTap;
  // 表示ロジックのみ
}
```

#### 再利用性
```dart
// ✅ 設定可能なコンポーネント
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final ButtonSize size;
  // ...
}

enum ButtonVariant { primary, secondary, text }
enum ButtonSize { small, medium, large }
```

### 2. パフォーマンス最適化

#### const Constructor
```dart
const PlanCard({
  super.key,
  required this.itinerary,
  this.onTap,
});
```

#### Builder パターン
```dart
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) => PlanCard(
    itinerary: items[index],
    onTap: () => _onPlanTap(items[index]),
  ),
)
```

### 3. テーマ対応

#### Theme.of(context) 使用
```dart
Container(
  decoration: BoxDecoration(
    color: Theme.of(context).colorScheme.surface,
    borderRadius: BorderRadius.circular(12),
  ),
  child: Text(
    text,
    style: Theme.of(context).textTheme.titleMedium,
  ),
)
```

#### カスタムテーマ拡張
```dart
extension AppTheme on ThemeData {
  Color get surfaceVariant => colorScheme.surfaceVariant;
  TextStyle get titleBold => textTheme.titleMedium!.copyWith(
    fontWeight: FontWeight.bold,
  );
}
```

## 📱 アクセシビリティ

### 1. セマンティクス
```dart
Semantics(
  label: 'プラン: ${itinerary.title}',
  hint: 'タップして詳細を表示',
  child: PlanCard(itinerary: itinerary),
)
```

### 2. タッチターゲット
```dart
// 最小44dpのタッチエリア確保
InkWell(
  onTap: onTap,
  child: Container(
    constraints: BoxConstraints(minHeight: 44, minWidth: 44),
    child: child,
  ),
)
```

### 3. フォーカス対応
```dart
Focus(
  onFocusChange: (hasFocus) {
    setState(() => _isFocused = hasFocus);
  },
  child: Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: _isFocused ? AppColors.primary : Colors.transparent,
        width: 2,
      ),
    ),
    child: child,
  ),
)
```

最終更新: 2024-12-06