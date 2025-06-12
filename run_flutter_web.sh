#!/bin/bash

# Cross-platform Flutter Web runner
# Automatically detects platform and sets appropriate Chrome path

set -e

# Detect platform and set Chrome executable
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if grep -q Microsoft /proc/version; then
        # WSL
        echo "🔧 Detected WSL environment"
        export CHROME_EXECUTABLE="/mnt/c/Program Files/Google/Chrome/Application/chrome.exe"
        export LANG=C.UTF-8
        export LC_ALL=C.UTF-8
    else
        # Linux
        echo "🔧 Detected Linux environment"
        if command -v google-chrome &> /dev/null; then
            export CHROME_EXECUTABLE="google-chrome"
        elif command -v chromium-browser &> /dev/null; then
            export CHROME_EXECUTABLE="chromium-browser"
        fi
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    echo "🔧 Detected macOS environment"
    export CHROME_EXECUTABLE="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
    # Windows
    echo "🔧 Detected Windows environment"
    if [ -f "C:/Program Files/Google/Chrome/Application/chrome.exe" ]; then
        export CHROME_EXECUTABLE="C:/Program Files/Google/Chrome/Application/chrome.exe"
    elif [ -f "C:/Program Files (x86)/Google/Chrome/Application/chrome.exe" ]; then
        export CHROME_EXECUTABLE="C:/Program Files (x86)/Google/Chrome/Application/chrome.exe"
    fi
fi

echo "🌐 Starting Flutter web development server..."
echo "   Chrome: $CHROME_EXECUTABLE"

# Run Flutter web with optimized settings
flutter run -d chrome \
    --web-hostname localhost \
    --web-port 8080 \
    --web-browser-flag="--disable-web-security" \
    --web-browser-flag="--disable-features=VizDisplayCompositor"