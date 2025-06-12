#!/bin/bash

# Cross-platform Flutter Web runner with WSL optimization
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
        
        # WSL specific settings - use WSL IP for Windows Chrome access
        WSL_IP=$(ip addr show eth0 | grep 'inet ' | awk '{print $2}' | cut -d/ -f1)
        WEB_HOSTNAME="0.0.0.0"  # Listen on all interfaces
        WEB_PORT="8080"
        
        echo "🔧 WSL IP Address: $WSL_IP"
        echo "🌐 Windows Chrome should access: http://$WSL_IP:$WEB_PORT"
        
        # Verify Chrome exists
        if [ ! -f "$CHROME_EXECUTABLE" ]; then
            echo "❌ Chrome not found at: $CHROME_EXECUTABLE"
            echo "   Please install Chrome on Windows or update the path"
            exit 1
        fi
        
    else
        # Linux
        echo "🔧 Detected Linux environment"
        if command -v google-chrome &> /dev/null; then
            export CHROME_EXECUTABLE="google-chrome"
        elif command -v chromium-browser &> /dev/null; then
            export CHROME_EXECUTABLE="chromium-browser"
        fi
        WEB_HOSTNAME="localhost"
        WEB_PORT="8080"
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    echo "🔧 Detected macOS environment"
    export CHROME_EXECUTABLE="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
    WEB_HOSTNAME="localhost"
    WEB_PORT="8080"
elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
    # Windows
    echo "🔧 Detected Windows environment"
    if [ -f "C:/Program Files/Google/Chrome/Application/chrome.exe" ]; then
        export CHROME_EXECUTABLE="C:/Program Files/Google/Chrome/Application/chrome.exe"
    elif [ -f "C:/Program Files (x86)/Google/Chrome/Application/chrome.exe" ]; then
        export CHROME_EXECUTABLE="C:/Program Files (x86)/Google/Chrome/Application/chrome.exe"
    fi
    WEB_HOSTNAME="localhost"
    WEB_PORT="8080"
fi

echo "🌐 Starting Flutter web development server..."
echo "   Chrome: $CHROME_EXECUTABLE"
echo "   URL: http://$WEB_HOSTNAME:$WEB_PORT"

# Ensure Flutter web is enabled
echo "⚙️  Configuring Flutter for web..."
flutter config --enable-web

# Check if devices are available
echo "🔍 Checking available devices..."
flutter devices

# Clean and prepare
echo "🧹 Cleaning previous build..."
flutter clean
flutter pub get

# Build web version first
echo "🔨 Building web app..."
flutter build web --verbose

# Run Flutter web with explicit settings for WSL compatibility
echo "🚀 Launching web app..."

if [[ "$OSTYPE" == "linux-gnu"* ]] && grep -q Microsoft /proc/version; then
    # WSL specific handling
    echo "🌐 Starting Flutter web server on $WEB_HOSTNAME:$WEB_PORT"
    echo "🔗 Browser URL: http://$WSL_IP:$WEB_PORT"
    
    # Start Flutter web server
    flutter run -d web-server \
        --web-hostname="$WEB_HOSTNAME" \
        --web-port="$WEB_PORT" \
        --verbose &
    
    # Wait for server to start
    sleep 5
    
    # Open Windows Chrome with the WSL IP
    echo "🚀 Opening Windows Chrome..."
    "$CHROME_EXECUTABLE" "http://$WSL_IP:$WEB_PORT" \
        --disable-web-security \
        --disable-features=VizDisplayCompositor \
        --no-sandbox \
        --disable-dev-shm-usage &
    
    # Wait for user input to stop
    echo "⏳ Press Ctrl+C to stop the web server"
    wait
else
    # Non-WSL handling (original)
    flutter run -d chrome \
        --web-hostname="$WEB_HOSTNAME" \
        --web-port="$WEB_PORT" \
        --web-browser-flag="--disable-web-security" \
        --web-browser-flag="--disable-features=VizDisplayCompositor" \
        --web-browser-flag="--no-sandbox" \
        --web-browser-flag="--disable-dev-shm-usage" \
        --verbose
fi