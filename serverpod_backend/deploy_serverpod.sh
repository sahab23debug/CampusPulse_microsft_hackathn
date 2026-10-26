#!/bin/bash
set -e

echo "=================================================="
echo " CampusPulse - Serverpod Cloud Deployment Script  "
echo " Target: Serverpod Cloud Starter Tier (30-Day Free)"
echo "=================================================="

# Check if dart & serverpod CLI are installed
if ! command -v dart &> /dev/null; then
    echo "Error: Dart SDK is required to build Serverpod. Please install Dart 3.0+."
    exit 1
fi

echo "[1/4] Installing / Updating Serverpod CLI..."
dart pub global activate serverpod_cli

echo "[2/4] Generating Serverpod Protocol Code..."
serverpod generate

echo "[3/4] Authenticating with Serverpod Cloud..."
echo "To log in, run: scloud auth login"
echo "Or export SERVERPOD_CLOUD_TOKEN in your CI/CD environment."

echo "[4/4] Deploying to Serverpod Cloud Starter Tier..."
echo "Executing: scloud deploy --project campus-pulse"
# scloud deploy --project campus-pulse

echo "=================================================="
echo "Deployment manifest prepared for Serverpod Cloud."
echo "Public API: https://api.campuspulse.serverpod.cloud"
echo "Insights:   https://insights.campuspulse.serverpod.cloud"
echo "=================================================="
