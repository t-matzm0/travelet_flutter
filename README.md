# Travelet - Travel Planning Flutter App

A cross-platform travel planning application built with Flutter, supporting multiple development environments.

## 📚 Documentation

- 🚀 **[Quick Start Guide](docs/QUICK_START.md)** - 5分で始める
- 🔧 **[Setup Guide](docs/SETUP_GUIDE.md)** - OS別詳細セットアップ手順

## 🚀 Quick Start

### Prerequisites
- Flutter SDK (3.5.3 or later)
- Dart SDK (3.5.3 or later)
- Platform-specific requirements (see below)

### Setup
```bash
# Clone the repository
git clone <repository-url>
cd travelet_flutter

# Run setup script (recommended)
chmod +x scripts/setup.sh
./scripts/setup.sh

# Or manual setup
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

## 🖥️ Development Environment Support

This project supports development on multiple platforms:

### Windows
- **Native Windows**: Full desktop and web support
- **WSL (Windows Subsystem for Linux)**: Linux desktop mode with Chrome web support

### macOS
- **Native macOS**: Full desktop and web support

### Linux
- **Native Linux**: Full desktop and web support

## 🎯 Running the App

### Desktop Application
```bash
# Cross-platform desktop runner (auto-detects platform)
./run_flutter_desktop.sh

# Platform-specific commands
flutter run -d windows   # Windows
flutter run -d macos     # macOS  
flutter run -d linux     # Linux
```

### Web Application
```bash
# Cross-platform web runner (auto-detects Chrome)
./run_flutter_web.sh

# Manual web run
flutter run -d chrome --web-hostname localhost --web-port 8080
```

### Mobile Development
```bash
# Android (requires Android SDK)
flutter run -d android

# iOS (requires Xcode, macOS only)
flutter run -d ios
```

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run specific test file
flutter test test/models/spot_test.dart
```

## 🏗️ Build

```bash
# Desktop builds
flutter build windows
flutter build macos
flutter build linux

# Web build
flutter build web

# Mobile builds
flutter build apk
flutter build ipa
```

## 📁 Project Structure

```
lib/
├── main.dart                 # App entry point with cross-platform font setup
├── models/                   # Data models with Freezed
│   ├── spot.dart            # Tourism spot model
│   ├── itinerary.dart       # Travel itinerary model
│   ├── itinerary_point.dart # Itinerary waypoint model
│   ├── itinerary_segment.dart # Travel segment model
│   └── transport_mode.dart  # Transportation mode enum
├── screens/                  # UI screens
└── components/              # Reusable UI components

test/
└── models/                  # Unit tests for models
```

## 🌐 Platform-Specific Features

### Font Rendering
The app automatically selects appropriate fonts based on the platform:
- **Windows**: Yu Gothic UI, Meiryo
- **macOS**: Hiragino Sans
- **Linux**: Noto Sans CJK JP, IPA fonts
- **Web**: System fonts with fallbacks

### Chrome Configuration
Web development is supported across platforms with automatic Chrome detection:
- **Windows**: `C:\Program Files\Google\Chrome\Application\chrome.exe`
- **WSL**: `/mnt/c/Program Files/Google/Chrome/Application/chrome.exe`
- **macOS**: `/Applications/Google Chrome.app/Contents/MacOS/Google Chrome`
- **Linux**: `google-chrome` or `chromium-browser`

## 🔧 Configuration

### Environment Variables
Copy `.env.example` to `.env` and customize for your environment:

```bash
cp .env.example .env
```

### Platform-Specific Settings
- **WSL**: Automatic Chrome path detection and UTF-8 locale setup
- **Linux**: Japanese font installation recommended
- **macOS**: Xcode command line tools required
- **Windows**: No additional setup required

## 📋 Available Scripts

- `./scripts/setup.sh` - Complete environment setup
- `./run_flutter_desktop.sh` - Cross-platform desktop runner
- `./run_flutter_web.sh` - Cross-platform web runner

## 🐛 Troubleshooting

### WSL Issues
- **Font rendering**: Install Japanese fonts with `sudo apt install fonts-noto-cjk`
- **Chrome access**: Ensure Windows Chrome is installed
- **Display**: Set `export DISPLAY=:0` if needed

### Font Issues
- **Windows**: Ensure Yu Gothic is installed (usually pre-installed)
- **macOS**: Hiragino Sans is included by default
- **Linux**: Install with `sudo apt install fonts-noto-cjk fonts-noto-cjk-extra`

### Flutter Doctor Issues
Run `flutter doctor` to check for platform-specific configuration issues.

## 🚀 Features

- ✅ Cross-platform development support (Windows/macOS/Linux/WSL)
- ✅ Travel spot management with photos and details
- ✅ Itinerary planning with transportation modes
- ✅ Comprehensive unit test coverage (21 tests)
- ✅ Freezed models with JSON serialization
- ✅ Material Design 3 UI
- ✅ Responsive font rendering across platforms

## 🔄 Development Workflow

1. **Setup**: Run `./scripts/setup.sh` once
2. **Development**: Use `./run_flutter_desktop.sh` or `./run_flutter_web.sh`
3. **Testing**: Run `flutter test` before committing
4. **Building**: Use `flutter build <platform>` for releases

This setup ensures consistent development experience regardless of your operating system or environment.