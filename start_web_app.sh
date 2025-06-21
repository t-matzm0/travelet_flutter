#!/bin/bash

# WSL用 Flutter Web アプリ起動スクリプト

set -e

echo "🚀 Travelet Flutter Web App - WSL版"
echo "========================================="

# WSL IP取得
WSL_IP=$(ip addr show eth0 | grep 'inet ' | awk '{print $2}' | cut -d/ -f1)
PORT="8080"

echo "📍 WSL IP Address: $WSL_IP"
echo "🌐 Web Server URL: http://$WSL_IP:$PORT"

# ビルド状況確認
if [ ! -f "build/web/main.dart.js" ]; then
    echo "⚠️  Web build not found. Building now..."
    flutter build web --release --no-tree-shake-icons
    echo "✅ Build completed"
else
    echo "✅ Using existing web build"
fi

# Webサーバー起動
echo "🔥 Starting HTTP server..."
cd build/web
python3 -m http.server $PORT --bind 0.0.0.0 &
SERVER_PID=$!

# サーバー起動待ち
sleep 3

# アクセス確認
if curl -s -f http://localhost:$PORT > /dev/null; then
    echo "✅ Web server is running successfully"
else
    echo "❌ Web server failed to start"
    kill $SERVER_PID 2>/dev/null
    exit 1
fi

echo ""
echo "🎯 アクセス方法："
echo "   Windows Chrome: http://$WSL_IP:$PORT"
echo "   WSL内ブラウザ:  http://localhost:$PORT"
echo ""
echo "📱 アプリ機能："
echo "   ✓ ホーム画面 - 旅行プラン一覧"
echo "   ✓ 検索機能 - スポット検索"
echo "   ✓ プラン詳細 - 旅程確認"
echo "   ✓ マイページ - ユーザー情報"
echo ""
echo "🛑 サーバー停止: Ctrl+C"
echo "========================================="

# クリーンアップ処理
cleanup() {
    echo ""
    echo "🛑 Stopping web server..."
    kill $SERVER_PID 2>/dev/null
    echo "✅ Server stopped"
}

trap cleanup INT TERM

# サーバー実行継続
wait $SERVER_PID