#!/bin/bash
set -e

echo "🚀 Neovim Development Environment Setup"
echo ""

# Detect OS and package manager
if command -v brew >/dev/null 2>&1; then
    echo "Using Homebrew..."
    PKG_MGR="brew"
    INSTALL_CMD="brew install"
    UPDATE_CMD="brew update"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Homebrew not found on macOS!"
    echo "Please install Homebrew first: https://brew.sh/"
    exit 1
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Using apt-get (Homebrew not available)..."
    PKG_MGR="apt"
    INSTALL_CMD="sudo apt-get install -y"
    UPDATE_CMD="sudo apt-get update"
else
    echo "Error: Unsupported OS"
    exit 1
fi

# Install function
install_pkg() {
    local pkg="$1"
    echo "Installing $pkg..."
    
    if [[ "$PKG_MGR" == "apt" ]]; then
        eval "$UPDATE_CMD"
    fi
    
    eval "$INSTALL_CMD $pkg"
}

# Check and install if missing
check_install() {
    local name="$1"
    local pkg_brew="${2:-$1}"
    local pkg_apt="${3:-$pkg_brew}"
    local post_install="${4:-}"
    
    if command -v "$name" >/dev/null 2>&1; then
        echo "✓ $name"
        return 0
    else
        echo "✗ $name - installing..."
        
        if [[ "$PKG_MGR" == "brew" ]]; then
            install_pkg "$pkg_brew"
        else
            install_pkg "$pkg_apt"
        fi
        
        # Выполнить post-install команду если есть
        if [[ -n "$post_install" ]]; then
            eval "$post_install"
        fi
        
        return $?
    fi
}

echo "=== REQUIRED DEPENDENCIES ==="
echo ""

# System packages
# Node.js: runtime for many JS tools, LSPs and npm-based formatters/linters
check_install "node" "node" "nodejs"
# npm: installs global JS tooling (prettier, live-server, etc.)
check_install "npm" "npm" "npm"
# Python3: used by formatters/linters and Python LSP servers
check_install "python3" "python3" "python3"
# Neovim: the editor itself
check_install "nvim" "neovim" "neovim"
# Git: required for plugin checkout and version control
check_install "git" "git" "git"
# LuaRocks: installs Lua rocks required by some Neovim plugins (hererocks/backends)
check_install "luarocks" "luarocks" "luarocks"
# fd: fast file finder used by many utilities (on Debian/Ubuntu package is fdfind)
check_install "fd" "fd" "fd-find" "[[ \"$PKG_MGR\" == \"apt\" ]] && sudo ln -sf \$(which fdfind) /usr/local/bin/fd 2>/dev/null || true"
# ripgrep: fast text search used by telescope and other tools
check_install "rg" "ripgrep" "ripgrep"

# Nerd Font installation 
source ./scripts/install_nerd_font.sh


echo ""
echo "=== OPTIONAL DEPENDENCIES ==="
echo ""

# Optional: Flutter/Dart
read -p "Install Flutter & Dart for Flutter development? (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    check_install "flutter" "flutter" "flutter"
    check_install "dart" "dart" "dart"
else
    echo "Skipping Flutter/Dart"
fi

echo ""
echo "=== GLOBAL PACKAGES ==="
echo ""

# npm packages
echo "Installing npm packages..."
for pkg in live-server prettier; do
    if npm list -g "$pkg" >/dev/null 2>&1; then
        echo "✓ $pkg"
    else
        echo "Installing $pkg..."
        npm install -g "$pkg" || echo "⚠ Failed to install $pkg"
    fi
done

echo ""
echo "=== NEOVIM CONFIGURATION ==="
echo ""

echo "Setting up Neovim plugins..."
if nvim --headless "+Lazy! sync" +qa 2>&1 | grep -q "error"; then
    echo "Trying alternative method..."
    nvim --headless "+Lazy sync" +qa
fi

echo ""
echo "✅ SETUP COMPLETE!"
echo ""
echo "Package manager used: $PKG_MGR"
echo "You can now start Neovim with 'nvim'. Enjoy coding!"