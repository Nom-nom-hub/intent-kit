#!/bin/bash

# Post-create script for Intent Kit devcontainer
# This script runs after the devcontainer is created

set -e  # Exit on any error

echo "🚀 Setting up Intent Kit development environment..."

# Install uv if not already installed
if ! command -v uv &> /dev/null; then
    echo "📦 Installing uv..."
    pip install uv
fi

# Install the package in development mode
echo "📦 Installing intent-kit in development mode..."
pip install -e .[dev,cli]

# Verify install
echo "✅ Verifying installation..."
intent check

# Install any additional dependencies
echo "📦 Installing additional dependencies..."
pip install black flake8 mypy

# Install some common AI agent CLIs if available
echo -e "\n🤖 Installing AI agent CLIs (if available)..."

# Qwen CLI if Python available
if command -v python3 &> /dev/null; then
    echo "  Installing Qwen CLI..."
    pip3 install qwen-cli || echo "  (Qwen CLI installation skipped)"
fi

# Node.js based tools (if node available)
if command -v npm &> /dev/null; then
    echo "  Installing npm-based CLIs..."
    npm install -g @google/gemini-cli || echo "  (Gemini CLI installation skipped)"
fi

echo "✅ Intent Kit development environment ready!"
echo "💡 Run 'intent --help' to get started"