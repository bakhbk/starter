#!/bin/bash

set -e

echo "🚀 Starting Neovim Development Environment Setup..."
echo ""

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to print status
print_status() {
    if [ $1 -eq 0 ]; then
        echo -e "${GREEN}✓${NC} $2"
    else
        echo -e "${RED}✗${NC} $2"
    fi
}

# Function to print warning
print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

# Detect OS
OS="unknown"
if [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="linux"
fi

echo "📦 Checking system dependencies..."
echo ""

# Check Flutter SDK (optional for Flutter development)
if command_exists flutter; then
    print_status 0 "Flutter SDK found: $(flutter --version | head -n1)"
else
    print_status 1 "Flutter SDK not found (optional - skip if not using Flutter)"
    print_warning "Install from: https://docs.flutter.dev/get-started/install"
fi

# Check Dart SDK (optional - comes with Flutter)
if command_exists dart; then
    print_status 0 "Dart SDK found: $(dart --version 2>&1 | head -n1)"
else
    print_status 1 "Dart SDK not found (optional - comes with Flutter)"
    print_warning "Dart comes with Flutter SDK"
fi

# Check Node.js
if command_exists node; then
    NODE_VERSION=$(node --version)
    print_status 0 "Node.js found: $NODE_VERSION"
else
    print_status 1 "Node.js not found"
    if [ "$OS" == "macos" ]; then
        print_warning "Install with: brew install node"
    else
        print_warning "Install from: https://nodejs.org/"
    fi
    MISSING_DEPS=true
fi

# Check npm
if command_exists npm; then
    print_status 0 "npm found: $(npm --version)"
else
    print_status 1 "npm not found (comes with Node.js)"
    MISSING_DEPS=true
fi

# Check Python
if command_exists python3; then
    PYTHON_VERSION=$(python3 --version)
    print_status 0 "Python found: $PYTHON_VERSION"
else
    print_status 1 "Python 3 not found"
    if [ "$OS" == "macos" ]; then
        print_warning "Install with: brew install python3"
    else
        print_warning "Install from: https://www.python.org/"
    fi
    MISSING_DEPS=true
fi

# Check pip
if command_exists pip3; then
    print_status 0 "pip3 found"
else
    print_status 1 "pip3 not found"
    MISSING_DEPS=true
fi

# Check Neovim
if command_exists nvim; then
    NVIM_VERSION=$(nvim --version | head -n1)
    print_status 0 "Neovim found: $NVIM_VERSION"
else
    print_status 1 "Neovim not found"
    if [ "$OS" == "macos" ]; then
        print_warning "Install with: brew install neovim"
    else
        print_warning "Install from: https://neovim.io/"
    fi
    MISSING_DEPS=true
fi

# Check Git
if command_exists git; then
    print_status 0 "Git found: $(git --version)"
else
    print_status 1 "Git not found"
    MISSING_DEPS=true
fi

echo ""

# Exit if critical dependencies are missing
if [ "$MISSING_DEPS" = true ]; then
    echo -e "${RED}❌ Critical dependencies missing. Please install them first.${NC}"
    echo "See SETUP.md for detailed installation instructions."
    echo ""
    echo "Note: Flutter/Dart are optional if you only need TypeScript/Python development."
    exit 1
fi

echo "✅ All required dependencies found!"
echo ""

# Install npm global packages
echo "📦 Installing npm global packages..."
if npm list -g live-server >/dev/null 2>&1; then
    print_status 0 "live-server already installed"
else
    echo "Installing live-server..."
    if npm install -g live-server; then
        print_status 0 "live-server installed"
    else
        print_status 1 "live-server installation failed (may need sudo)"
    fi
fi

if npm list -g prettier >/dev/null 2>&1; then
    print_status 0 "prettier already installed"
else
    echo "Installing prettier..."
    if npm install -g prettier; then
        print_status 0 "prettier installed"
    else
        print_status 1 "prettier installation failed (may need sudo)"
    fi
fi

echo ""

# Install Python packages
echo "📦 Installing Python packages..."
if python3 -c "import black" 2>/dev/null; then
    print_status 0 "black already installed"
else
    echo "Installing black..."
    if pip3 install black; then
        print_status 0 "black installed"
    else
        print_status 1 "black installation failed (try: pip3 install --user black)"
    fi
fi

echo ""

# Bootstrap Neovim
echo "🔧 Bootstrapping Neovim configuration..."
echo "This will:"
echo "  - Install lazy.nvim plugin manager"
echo "  - Install all plugins from lazy-lock.json"
echo "  - Install Mason tools (LSPs, formatters, linters)"
echo ""
echo "Press ENTER to continue or Ctrl+C to cancel..."
read -r _

# Run Neovim headless to install plugins
echo "Installing Neovim plugins..."
nvim --headless "+Lazy! sync" +qa

print_status $? "Neovim plugins installed"

echo ""
echo "✨ Setup complete!"
echo ""
echo "Next steps:"
echo "  1. Run 'nvim' to start Neovim"
echo "  2. Mason will auto-install configured tools on first launch"
echo "  3. For Flutter development, run 'flutter doctor' to verify setup"
echo ""
echo "Key shortcuts:"
echo "  - <leader> is <Space> by default"
echo "  - <Space>fr : Flutter run"
echo "  - <Space>tt : Run nearest test"
echo "  - <F5>      : Start debugging"
echo "  - <Ctrl-\\> : Toggle terminal"
echo ""
echo "See lua/plugins/ for complete plugin configuration"
