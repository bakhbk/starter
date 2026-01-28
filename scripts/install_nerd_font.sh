#!/usr/bin/env bash
# Install / detect Nerd Fonts. Intended to be sourced from setup.sh

# Nerd Fonts: used by icon themes (shows squares if missing)
font_found=false
if command -v fc-list >/dev/null 2>&1; then
    if fc-list | grep -i -E 'nerd|MesloLGS|Meslo|Hack|Fira|JetBrains' >/dev/null 2>&1; then
        echo "✓ Nerd Font detected"
        font_found=true
    fi
else
    if [[ -d "$HOME/Library/Fonts" ]] && ls "$HOME/Library/Fonts" | grep -i -E 'Meslo|Hack|Fira|JetBrains|Nerd' >/dev/null 2>&1; then
        echo "✓ Nerd Font detected in ~/Library/Fonts"
        font_found=true
    fi
fi

if [[ "$font_found" != true ]]; then
    echo "✗ Nerd Font not found - installing..."
    if [[ "$PKG_MGR" == "brew" ]]; then
        brew tap homebrew/cask-fonts >/dev/null 2>&1 || true
        if brew install --cask font-meslo-lg-nerd-font >/dev/null 2>&1; then
            echo "✓ Installed font-meslo-lg-nerd-font"
        elif brew install --cask font-hack-nerd-font >/dev/null 2>&1; then
            echo "✓ Installed font-hack-nerd-font"
        else
            echo "⚠ Failed to install Nerd Font via Homebrew. You may need to install it manually."
        fi
    else
        # Linux: try to download a patched Meslo from Nerd Fonts releases
        if ! command -v curl >/dev/null 2>&1; then
            echo "Installing curl..."
            if [[ "$PKG_MGR" == "apt" ]]; then
                sudo apt-get update && sudo apt-get install -y curl unzip || true
            fi
        fi
        mkdir -p "$HOME/.local/share/fonts"
        tmpdir=$(mktemp -d)
        echo "Downloading Meslo Nerd Font..."
        curl -sL -o "$tmpdir/meslo.zip" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Meslo.zip" || true
        if [[ -f "$tmpdir/meslo.zip" ]]; then
            unzip -o "$tmpdir/meslo.zip" -d "$tmpdir" >/dev/null 2>&1 || true
            find "$tmpdir" -type f \( -iname "*.ttf" -o -iname "*.otf" \) -exec mv -f {} "$HOME/.local/share/fonts/" \; >/dev/null 2>&1 || true
            if command -v fc-cache >/dev/null 2>&1; then
                fc-cache -f -v >/dev/null 2>&1 || true
            fi
            echo "✓ Installed Nerd Font to $HOME/.local/share/fonts"
        else
            echo "⚠ Failed to download Nerd Fonts. Please install manually from https://www.nerdfonts.com/"
        fi
        rm -rf "$tmpdir"
    fi
fi
