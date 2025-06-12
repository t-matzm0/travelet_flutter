#!/bin/bash

# Travelet Flutter Development Environment Setup Script
# Supports: Windows, macOS, Linux, WSL

set -e

echo "🚀 Setting up Travelet Flutter development environment..."

# Detect platform
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if grep -q Microsoft /proc/version; then
        PLATFORM="wsl"
        echo "📱 Detected: Windows WSL"
    else
        PLATFORM="linux"
        echo "🐧 Detected: Linux"
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    PLATFORM="macos"
    echo "🍎 Detected: macOS"
elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
    PLATFORM="windows"
    echo "🪟 Detected: Windows"
else
    PLATFORM="unknown"
    echo "❓ Unknown platform: $OSTYPE"
fi

# Check Flutter installation
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter not found. Please install Flutter first."
    echo "   Visit: https://docs.flutter.dev/get-started/install"
    exit 1
fi

echo "✅ Flutter found: $(flutter --version | head -1)"

# Check Dart version compatibility
DART_VERSION=$(dart --version 2>&1 | grep -o '[0-9]\+\.[0-9]\+\.[0-9]\+' | head -1)
echo "✅ Dart version: $DART_VERSION"

# Install dependencies
echo "📦 Installing Flutter dependencies..."
flutter pub get

# Generate code if needed
if [ -d "lib/models" ] && find lib/models -name "*.dart" -not -name "*.g.dart" -not -name "*.freezed.dart" | grep -q .; then
    echo "🔧 Generating code with build_runner..."
    flutter pub run build_runner build --delete-conflicting-outputs
fi

# Platform-specific setup
case $PLATFORM in
    "wsl")
        echo "🔧 WSL-specific setup..."
        # Check if Chrome is accessible
        if [ -f "/mnt/c/Program Files/Google/Chrome/Application/chrome.exe" ]; then
            echo "✅ Windows Chrome found"
            echo 'export CHROME_EXECUTABLE="/mnt/c/Program Files/Google/Chrome/Application/chrome.exe"' >> ~/.bashrc
        fi
        ;;
    "linux")
        echo "🔧 Linux-specific setup..."
        # Check for Japanese fonts
        if ! fc-list :lang=ja | grep -q .; then
            echo "⚠️  Japanese fonts not found. Consider installing:"
            echo "   sudo apt install fonts-noto-cjk fonts-noto-cjk-extra"
        fi
        ;;
    "macos")
        echo "🔧 macOS-specific setup..."
        # Check Xcode command line tools
        if ! xcode-select -p &> /dev/null; then
            echo "⚠️  Xcode command line tools not found. Install with:"
            echo "   xcode-select --install"
        fi
        ;;
    "windows")
        echo "🔧 Windows-specific setup..."
        ;;
esac

# Run tests
echo "🧪 Running tests..."
flutter test

# Check for common issues
echo "🔍 Running Flutter doctor..."
flutter doctor

echo ""
echo "✅ Setup complete!"
echo ""
echo "📚 Available commands:"
echo "   flutter run -d linux     # Run on Linux desktop"
echo "   flutter run -d chrome    # Run on Chrome browser"
echo "   flutter run -d windows   # Run on Windows desktop"
echo "   flutter run -d macos     # Run on macOS desktop"
echo "   flutter test             # Run tests"
echo "   flutter doctor           # Check environment"
echo ""
echo "🌐 For web development:"
echo "   flutter run -d chrome --web-hostname localhost --web-port 8080"
echo ""
echo "📝 Check .env.example for platform-specific configurations"