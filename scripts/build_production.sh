#!/bin/bash

echo "🚀 Building Travelet for production environment..."

# Clean previous builds
flutter clean
flutter pub get

# Build for production environment
flutter build web --release \
  --no-tree-shake-icons \
  --target=lib/main_production.dart \
  --dart-define=ENVIRONMENT=production

echo "✅ Production build completed successfully!"
echo "📁 Build output: build/web/"
echo "🌐 Deploy with: firebase deploy --only hosting:production --project=travelet-flutter"