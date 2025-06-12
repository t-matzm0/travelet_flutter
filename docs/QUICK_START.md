# Travelet Flutter クイックスタートガイド

## 🚀 5分で始める

### 前提条件
- Git がインストール済み
- Flutter SDK がインストール済み（未インストールの場合は[SETUP_GUIDE.md](./SETUP_GUIDE.md)参照）

### 手順

#### 1️⃣ クローン
```bash
git clone https://github.com/t-matzm0/travelet_flutter.git
cd travelet_flutter
```

#### 2️⃣ セットアップ（自動）
```bash
# Unix系（macOS/Linux/WSL）
chmod +x scripts/setup.sh
./scripts/setup.sh

# Windows（Git Bash推奨）
sh scripts/setup.sh
```

#### 3️⃣ 実行

**デスクトップアプリとして：**
```bash
./run_flutter_desktop.sh
# または
flutter run -d windows  # Windows
flutter run -d macos    # macOS
flutter run -d linux    # Linux
```

**Webアプリとして：**
```bash
./run_flutter_web.sh
# または
flutter run -d chrome
```

## 🎯 プラットフォーム別ワンライナー

### Windows (PowerShell)
```powershell
git clone https://github.com/t-matzm0/travelet_flutter.git; cd travelet_flutter; flutter pub get; flutter run -d windows
```

### macOS/Linux
```bash
git clone https://github.com/t-matzm0/travelet_flutter.git && cd travelet_flutter && ./scripts/setup.sh && ./run_flutter_desktop.sh
```

### WSL
```bash
git clone https://github.com/t-matzm0/travelet_flutter.git && cd travelet_flutter && ./scripts/setup.sh && ./run_flutter_web.sh
```

## ⚡ トラブルシューティング

### よくあるエラーと解決法

| エラー | 解決方法 |
|--------|----------|
| `flutter: command not found` | FlutterをPATHに追加: `export PATH="$PATH:$HOME/flutter/bin"` |
| Chrome実行エラー（WSL） | `export CHROME_EXECUTABLE="/mnt/c/Program Files/Google/Chrome/Application/chrome.exe"` |
| 日本語文字化け | 日本語フォントインストール: `sudo apt install fonts-noto-cjk` |
| `flutter doctor` エラー | `flutter doctor -v` で詳細確認 |

### 環境リセット
```bash
flutter clean
rm -rf .dart_tool build
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

## 📱 開発コマンド集

```bash
# テスト実行
flutter test

# ホットリロード有効で実行
flutter run

# リリースビルド
flutter build windows
flutter build macos
flutter build linux
flutter build web

# コード生成
flutter pub run build_runner build

# 静的解析
flutter analyze
```

## 🔍 プロジェクト構造

```
travelet_flutter/
├── lib/              # ソースコード
│   ├── main.dart    # エントリーポイント
│   ├── models/      # データモデル
│   ├── screens/     # 画面
│   └── components/  # UIコンポーネント
├── test/            # テストコード
├── scripts/         # 便利スクリプト
└── docs/            # ドキュメント
```

## 📚 次のステップ

1. [詳細な環境構築ガイド](./SETUP_GUIDE.md)
2. [README.md](../README.md) - プロジェクト概要
3. コードを編集して `r` キーでホットリロード

---

困ったときは: [Issues](https://github.com/t-matzm0/travelet_flutter/issues) で質問してください。