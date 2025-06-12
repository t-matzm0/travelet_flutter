#!/bin/bash

# Cross-platform Flutter Desktop runner

set -e

# Detect platform
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if grep -q Microsoft /proc/version; then
        echo "🔧 WSL detected - running Linux desktop mode"
        # WSL specific settings
        export LANG=C.UTF-8
        export LC_ALL=C.UTF-8
        export DISPLAY=:0
    else
        echo "🔧 Linux detected"
        # Native Linux settings for better Japanese font support
        export LANG=ja_JP.UTF-8
        export LC_ALL=ja_JP.UTF-8
        export GTK_IM_MODULE=ibus
        export XMODIFIERS=@im=ibus
        export QT_IM_MODULE=ibus
    fi
    
    echo "🖥️  Starting Flutter Linux desktop app..."
    flutter run -d linux
    
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "🍎 macOS detected"
    echo "🖥️  Starting Flutter macOS desktop app..."
    flutter run -d macos
    
elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
    echo "🪟 Windows detected"
    echo "🖥️  Starting Flutter Windows desktop app..."
    flutter run -d windows
    
else
    echo "❓ Unknown platform: $OSTYPE"
    echo "🖥️  Attempting to run Flutter desktop app..."
    flutter run
fi