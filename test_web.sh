#!/bin/bash

# Simple web test script for WSL

set -e

echo "🔧 WSL Flutter Web Test"

# Get WSL IP
WSL_IP=$(ip addr show eth0 | grep 'inet ' | awk '{print $2}' | cut -d/ -f1)
echo "📍 WSL IP: $WSL_IP"

# Chrome path
CHROME_PATH="/mnt/c/Program Files/Google/Chrome/Application/chrome.exe"
echo "🌐 Chrome: $CHROME_PATH"

# Build web app
echo "🔨 Building web app..."
flutter build web

# Start simple HTTP server from build output
echo "🚀 Starting HTTP server on port 8080..."
cd build/web
python3 -m http.server 8080 --bind 0.0.0.0 &
SERVER_PID=$!

# Wait for server to start
sleep 3

# Test local access
echo "🧪 Testing local access..."
curl -s -o /dev/null -w "%{http_code}" http://localhost:8080 | head -1

# Open Windows Chrome
echo "🚀 Opening Windows Chrome..."
"$CHROME_PATH" "http://$WSL_IP:8080" \
    --new-window \
    --disable-web-security \
    --user-data-dir=/tmp/chrome-dev-session &

echo "✅ Chrome should open at: http://$WSL_IP:8080"
echo "⏳ Press Ctrl+C to stop the server"

# Handle cleanup
trap "kill $SERVER_PID; exit" INT TERM

# Wait
wait $SERVER_PID