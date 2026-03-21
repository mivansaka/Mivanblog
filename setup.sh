#!/bin/bash

# Setup script for The Modern Scholar blog

set -e

echo "🌱 Setting up The Modern Scholar blog..."

# Check if Hugo is installed
if ! command -v hugo &> /dev/null; then
    echo "❌ Hugo is not installed. Please install Hugo first:"
    echo "   brew install hugo  # macOS"
    echo "   choco install hugo-extended  # Windows"
    echo "   sudo snap install hugo  # Linux"
    exit 1
fi

echo "✅ Hugo is installed"

# Initialize PaperMod theme as a submodule
if [ ! -d "themes/PaperMod" ]; then
    echo "📦 Initializing PaperMod theme..."
    git submodule add https://github.com/adityatelange/hugo-PaperMod.git themes/PaperMod
    git submodule update --init --recursive
    echo "✅ PaperMod theme initialized"
else
    echo "✅ PaperMod theme already exists"
fi

# Build the site to verify
echo "🏗️  Building site..."
hugo --minify
echo "✅ Site built successfully"

# Start local server
echo ""
echo "🚀 Starting local server..."
echo "   Open http://localhost:1313 in your browser"
echo "   Press Ctrl+C to stop"
echo ""
hugo server -D --buildDrafts
