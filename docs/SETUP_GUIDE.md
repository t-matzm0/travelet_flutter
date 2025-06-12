# Travelet Flutter 環境構築ガイド

このガイドでは、各OS環境でのTravelet Flutterアプリケーションの開発環境構築手順を詳しく説明します。

## 📋 目次

1. [Windows](#windows)
   - [ネイティブWindows](#ネイティブwindows)
   - [WSL (Windows Subsystem for Linux)](#wsl-windows-subsystem-for-linux)
2. [macOS](#macos)
3. [Linux](#linux)
4. [共通設定](#共通設定)
5. [トラブルシューティング](#トラブルシューティング)

---

## Windows

### ネイティブWindows

#### 1. 事前準備

**必須ソフトウェア：**
- Windows 10/11 (64-bit)
- Git for Windows
- Visual Studio 2022 以降（C++デスクトップ開発ワークロード付き）
- Google Chrome

#### 2. Flutter SDK インストール

```powershell
# 1. Flutter SDK をダウンロード
# https://docs.flutter.dev/get-started/install/windows から最新版をダウンロード

# 2. C:\flutter など任意の場所に解凍

# 3. 環境変数PATHに追加
# システムプロパティ > 環境変数 > Path に C:\flutter\bin を追加

# 4. PowerShellで確認
flutter --version
```

#### 3. Android Studio インストール（オプション）

Android開発を行う場合：
```powershell
# Android Studioをダウンロードしてインストール
# https://developer.android.com/studio

# Android SDKのセットアップは初回起動時に自動実行
```

#### 4. プロジェクトセットアップ

```powershell
# リポジトリをクローン
git clone https://github.com/t-matzm0/travelet_flutter.git
cd travelet_flutter

# 依存関係インストール
flutter pub get

# コード生成
flutter pub run build_runner build --delete-conflicting-outputs

# 環境確認
flutter doctor
```

#### 5. アプリケーション実行

```powershell
# Windowsデスクトップアプリとして実行
flutter run -d windows

# Chrome上で実行
flutter run -d chrome

# または付属スクリプトを使用（Git Bash推奨）
./run_flutter_desktop.sh
./run_flutter_web.sh
```

### WSL (Windows Subsystem for Linux)

#### 1. WSL2 セットアップ

```powershell
# PowerShell（管理者権限）で実行
wsl --install

# WSL2をデフォルトに設定
wsl --set-default-version 2

# Ubuntuをインストール（Microsoft Store経由でも可）
wsl --install -d Ubuntu-22.04
```

#### 2. WSL内でのFlutter インストール

```bash
# WSL Ubuntuターミナルで実行

# 1. 必要なパッケージをインストール
sudo apt update
sudo apt install -y curl git unzip xz-utils zip libglu1-mesa

# 2. Flutter SDKをダウンロード
cd ~
git clone https://github.com/flutter/flutter.git -b stable

# 3. PATHに追加
echo 'export PATH="$PATH:$HOME/flutter/bin"' >> ~/.bashrc
source ~/.bashrc

# 4. 確認
flutter --version
```

#### 3. 日本語フォント対応

```bash
# 日本語フォントをインストール
sudo apt install -y fonts-noto-cjk fonts-noto-cjk-extra

# フォントキャッシュ更新
fc-cache -fv
```

#### 4. Chrome連携設定

```bash
# Windows側のChromeを使用するための設定
echo 'export CHROME_EXECUTABLE="/mnt/c/Program Files/Google/Chrome/Application/chrome.exe"' >> ~/.bashrc
source ~/.bashrc
```

#### 5. GUI表示設定（Linux Desktop実行用）

```bash
# X11サーバー（VcXsrv等）をWindows側でインストール・起動後
export DISPLAY=:0

# または WSLg（Windows 11）を使用
# WSLgは自動設定されるため追加設定不要
```

#### 6. プロジェクトセットアップ

```bash
# リポジトリをクローン
git clone https://github.com/t-matzm0/travelet_flutter.git
cd travelet_flutter

# セットアップスクリプト実行
chmod +x scripts/setup.sh
./scripts/setup.sh
```

---

## macOS

### 1. 事前準備

**必須ソフトウェア：**
- macOS 10.15 (Catalina) 以降
- Xcode（App Store からインストール）
- Homebrew

#### 2. Xcode Command Line Tools

```bash
# Xcodeコマンドラインツールをインストール
xcode-select --install

# ライセンス同意
sudo xcodebuild -license accept
```

#### 3. Flutter SDK インストール

```bash
# Homebrewを使用
brew install flutter

# または手動インストール
cd ~
git clone https://github.com/flutter/flutter.git -b stable
echo 'export PATH="$PATH:$HOME/flutter/bin"' >> ~/.zshrc
source ~/.zshrc
```

#### 4. CocoaPods インストール（iOS開発用）

```bash
sudo gem install cocoapods
```

#### 5. プロジェクトセットアップ

```bash
# リポジトリをクローン
git clone https://github.com/t-matzm0/travelet_flutter.git
cd travelet_flutter

# セットアップスクリプト実行
chmod +x scripts/setup.sh
./scripts/setup.sh
```

#### 6. アプリケーション実行

```bash
# macOSデスクトップアプリとして実行
flutter run -d macos

# Chrome上で実行
flutter run -d chrome

# iOS Simulator（要Xcode）
open -a Simulator
flutter run -d ios

# または付属スクリプトを使用
./run_flutter_desktop.sh
./run_flutter_web.sh
```

---

## Linux

### Ubuntu/Debian系

#### 1. 必要なパッケージのインストール

```bash
# システムパッケージ更新
sudo apt update
sudo apt upgrade -y

# 必要な依存関係
sudo apt install -y \
  curl git unzip xz-utils zip libglu1-mesa \
  clang cmake ninja-build pkg-config \
  libgtk-3-dev liblzma-dev \
  libstdc++-12-dev
```

#### 2. Flutter SDK インストール

```bash
# Flutter SDKをダウンロード
cd ~
git clone https://github.com/flutter/flutter.git -b stable

# PATHに追加
echo 'export PATH="$PATH:$HOME/flutter/bin"' >> ~/.bashrc
source ~/.bashrc

# 確認
flutter --version
```

#### 3. 日本語フォント対応

```bash
# 日本語フォントインストール
sudo apt install -y \
  fonts-noto-cjk \
  fonts-noto-cjk-extra \
  fonts-ipafont \
  fonts-ipaexfont

# フォントキャッシュ更新
fc-cache -fv
```

#### 4. Chrome/Chromium インストール

```bash
# Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt update
sudo apt install -y google-chrome-stable

# または Chromium
sudo apt install -y chromium-browser
```

#### 5. プロジェクトセットアップ

```bash
# リポジトリをクローン
git clone https://github.com/t-matzm0/travelet_flutter.git
cd travelet_flutter

# セットアップスクリプト実行
chmod +x scripts/setup.sh
./scripts/setup.sh
```

### Fedora/RHEL系

```bash
# 必要なパッケージ
sudo dnf install -y \
  git curl unzip which \
  gtk3-devel gcc-c++ \
  clang cmake ninja-build

# 以降の手順はUbuntuと同様
```

### Arch Linux

```bash
# 必要なパッケージ
sudo pacman -S --needed \
  git curl unzip which \
  gtk3 base-devel clang cmake ninja

# Flutter SDKはAURから
yay -S flutter

# 以降の手順はUbuntuと同様
```

---

## 共通設定

### 環境変数設定

プロジェクトルートに `.env` ファイルを作成：

```bash
# .env.example をコピー
cp .env.example .env

# 必要に応じて編集
# 例: Chrome実行ファイルパスの指定
```

### VS Code 設定

推奨拡張機能：
- Flutter
- Dart
- Error Lens
- GitLens

`.vscode/settings.json`:
```json
{
  "dart.flutterSdkPath": "${env:HOME}/flutter",
  "editor.formatOnSave": true,
  "editor.codeActionsOnSave": {
    "source.fixAll": true
  }
}
```

### Git 設定

```bash
# 改行コード自動変換を無効化（クロスプラットフォーム開発用）
git config core.autocrlf false

# 日本語ファイル名を正しく表示
git config core.quotepath false
```

---

## トラブルシューティング

### 共通の問題

#### Flutter doctor でエラーが出る

```bash
# 詳細な診断情報を表示
flutter doctor -v

# よくある解決策
flutter clean
flutter pub get
flutter pub upgrade
```

#### ビルドエラー

```bash
# キャッシュクリア
flutter clean
rm -rf ~/.pub-cache
flutter pub get

# 生成ファイル再作成
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
```

### Windows固有の問題

#### Visual Studio が見つからない

Visual Studio Installerから「C++によるデスクトップ開発」ワークロードを追加インストール

#### 長いパスエラー

```powershell
# 管理者権限でPowerShellを開いて実行
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -Name "LongPathsEnabled" -Value 1 -PropertyType DWORD -Force
```

### WSL固有の問題

#### Chrome実行時の文字化け

```bash
# ロケール設定
sudo locale-gen ja_JP.UTF-8
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
```

#### GUI表示されない

```bash
# Windows 11 + WSLg の場合
wsl --update

# Windows 10 の場合はVcXsrv等のX11サーバーをインストール
export DISPLAY=:0
```

### macOS固有の問題

#### 開発元不明のエラー

```bash
# セキュリティ設定で許可するか、以下を実行
sudo spctl --master-disable
# 使用後は再度有効化
sudo spctl --master-enable
```

### Linux固有の問題

#### libGLエラー

```bash
# 追加パッケージインストール
sudo apt install -y libglu1-mesa-dev mesa-common-dev
```

#### 日本語入力

```bash
# IBus設定
sudo apt install -y ibus ibus-mozc
ibus-setup
```

---

## 📞 サポート

問題が解決しない場合：

1. [Flutter公式ドキュメント](https://docs.flutter.dev/)
2. [プロジェクトのIssues](https://github.com/t-matzm0/travelet_flutter/issues)
3. `flutter doctor -v` の出力を含めて報告

---

最終更新: 2024年12月