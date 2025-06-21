#!/bin/bash

echo "🔧 Building Travelet for staging environment..."

# Clean previous builds
flutter clean
flutter pub get

# Build for staging environment
flutter build web --release \
  --no-tree-shake-icons \
  --target=lib/main_staging.dart \
  --dart-define=ENVIRONMENT=staging

echo "✅ Staging build completed successfully!"
echo "📁 Build output: build/web/"
echo "🌐 Deploy with: firebase hosting:channel:deploy staging --project=travelet-flutter"