#!/bin/bash
set -e
echo "=== Building ChatDZ (Android Native) ==="

# This is NOT a Flutter project
if [ -f pubspec.yaml ]; then
  echo "WARNING: pubspec.yaml found but this is an Android project"
fi

export JAVA_HOME=${JAVA_HOME:-/usr/lib/jvm/java-17-openjdk-amd64}
export ANDROID_HOME=${ANDROID_HOME:-$HOME/Android/Sdk}

if command -v gradle &>/dev/null; then
  gradle assembleDebug --stacktrace --no-daemon
elif [ -f ./gradlew ]; then
  chmod +x ./gradlew
  ./gradlew assembleDebug --stacktrace --no-daemon
else
  echo "ERROR: Neither gradle nor gradlew found"
  exit 1
fi

echo "=== Build finished ==="
find app/build/outputs -name "*.apk" 2>/dev/null || true
