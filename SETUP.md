# Neovim Development Environment Setup

Complete setup guide for LazyVim-based development environment optimized for Flutter/Dart, TypeScript, Python, and Lua.

## Prerequisites

Before running the setup script, install these SDKs manually:

### 1. Flutter SDK (includes Dart)

**macOS:**
```bash
# Download from official site
# https://docs.flutter.dev/get-started/install/macos

# Or using FVM (Flutter Version Management)
brew tap leoafarias/fvm
brew install fvm
fvm install stable
fvm use stable
```

**Linux:**
```bash
# Follow official guide
# https://docs.flutter.dev/get-started/install/linux
```

**Verify:**
```bash
flutter doctor
dart --version
```

### 2. Node.js 18+ (includes npm)

**macOS:**
```bash
brew install node
```

**Linux (Ubuntu/Debian):**
```bash
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs
```

**Verify:**
```bash
node --version
npm --version
```

### 3. Python 3.8+ (includes pip3)

**macOS:**
```bash
brew install python3
```

**Linux (Ubuntu/Debian):**
```bash
sudo apt-get update
sudo apt-get install python3 python3-pip
```

**Verify:**
```bash
python3 --version
pip3 --version
```

### 4. Neovim 0.9+

**macOS:**
```bash
brew install neovim
```

**Linux (Ubuntu/Debian):**
```bash
# Using official PPA
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
```

**Verify:**
```bash
nvim --version
```

## Quick Setup

Once prerequisites are installed:

```bash
# Clone this configuration
git clone <your-repo-url> ~/.config/nvim
cd ~/.config/nvim

# Run automated setup
./setup.sh

# Start Neovim
nvim
```

The setup script will:
- ✅ Verify all system dependencies (Flutter, Dart, Node.js, Python, Neovim, Git)
- 📦 Install npm global packages (prettier, live-server)
- 🐍 Install Python packages (black)
- 🔌 Bootstrap Neovim and install all plugins via lazy.nvim
- 🛠️ Trigger Mason to install LSPs, formatters, and linters

## Manual Setup (Alternative)

If you prefer manual installation:

```bash
# Install npm packages
npm install -g prettier live-server

# Install Python packages
pip3 install black

# Start Neovim (plugins auto-install on first launch)
nvim
```

On first Neovim launch:
- Lazy.nvim will sync plugins from `lazy-lock.json`
- Mason will auto-install: `stylua`, `shellcheck`, `shfmt`, `flake8`, `prettier`, `black`

## Configuration Structure

```
~/.config/nvim/
├── init.lua                    # Entry point
├── setup.sh                    # Automated setup script
├── lazy-lock.json              # Plugin versions lockfile
├── lua/
│   ├── config/
│   │   ├── autocmds.lua       # Format on save, auto-save for Flutter
│   │   ├── keymaps.lua        # Custom keybindings
│   │   ├── lazy.lua           # Lazy.nvim bootstrap
│   │   └── options.lua        # Vim options (clipboard, splits, etc.)
│   └── plugins/
│       ├── init.lua           # Core plugins (cmp, telescope, lualine, conform, etc.)
│       ├── coding/            # Snippets, autopairs, code actions, commenter, rename
│       ├── dap/               # Debugging (nvim-dap, dap-ui)
│       ├── lang/              # Language-specific (flutter-tools, package-info)
│       ├── test/              # Testing (neotest)
│       ├── tools/             # Terminal, live-server, git-conflict
│       └── ui/                # UI enhancements (fidget, folding, navic)
```

## Key Features

### Flutter/Dart Development
- **flutter-tools.nvim** - Complete Flutter integration
- **DAP debugging** - Visual debugger with breakpoints
- **Neotest** - Run/debug tests inline
- **Auto-save** - Triggers Flutter hot reload
- **Format on save** - dart_format with 3s timeout
- **Outline & Dev Tools** - Widget tree navigation

### Code Editing
- **LuaSnip** - Snippet expansion with friendly-snippets
- **nvim-autopairs** - Auto-close brackets/quotes
- **nvim-lightbulb** - 💡 indicator for code actions
- **inc-rename** - Live preview rename
- **NERDCommenter** - Quick commenting

### LSP & Formatting
- **conform.nvim** - Formatting with dart_format, prettier, black, stylua
- **Mason** - LSP/formatter/linter installer
- **Navic breadcrumbs** - Context-aware code navigation in winbar

### UI/UX
- **lualine** - Status line with navic integration
- **Trouble** - Diagnostics panel
- **Telescope** - Fuzzy finder
- **nvim-ufo** - LSP-based folding
- **Fidget** - LSP progress notifications

## Essential Keybindings

**Leader key:** `<Space>`

### Flutter
| Key | Action |
|-----|--------|
| `<leader>fr` | Flutter run |
| `<leader>fq` | Flutter quit |
| `<leader>fR` | Flutter restart |
| `<leader>fl` | Flutter reload |
| `<leader>fd` | Flutter devices |
| `<leader>fe` | Flutter emulators |
| `<leader>fo` | Flutter outline |
| `<leader>ft` | Flutter dev tools |
| `<leader>fL` | Flutter log clear |
| `<leader>fp` | Flutter pub get |

### Testing
| Key | Action |
|-----|--------|
| `<leader>tt` | Run nearest test |
| `<leader>tf` | Run file tests |
| `<leader>td` | Debug nearest test |
| `<leader>ts` | Toggle test summary |
| `<leader>to` | Show test output |
| `<leader>tO` | Toggle output panel |

### Debugging
| Key | Action |
|-----|--------|
| `<F5>` | Continue/Start debug |
| `<F10>` | Step over |
| `<F11>` | Step into |
| `<F12>` | Step out |
| `<leader>du` | Toggle DAP UI |
| `<leader>de` | Evaluate expression |

### Code Actions
| Key | Action |
|-----|--------|
| `<leader>ca` | Code action |
| `<leader>cp` | Code action (with preview) |
| `<leader>rn` | Rename symbol |
| `<leader>ri` | Incremental rename |
| `gd` | Go to definition |
| `gr` | Go to references |
| `K` | Hover documentation |

### General
| Key | Action |
|-----|--------|
| `<Ctrl-\>` | Toggle terminal |
| `jj` | Exit insert mode |
| `<leader>/` | Toggle comment |
| `<leader>xx` | Toggle diagnostics |
| `<leader>ls` | Start live-server |

## Troubleshooting

### Plugins not installing
```bash
# Manually sync plugins
nvim --headless "+Lazy! sync" +qa
```

### Mason tools not installing
```bash
# Inside Neovim
:Mason
# Press 'i' to install missing tools
```

### Format on save not working
```bash
# Check formatter is installed
:ConformInfo

# Mason should have: dart_format, prettier, black, stylua
```

### Flutter tools not working
```bash
# Verify Flutter SDK
flutter doctor

# Check LSP is attached
:LspInfo
```

### DAP debugging not starting
```bash
# Ensure Dart SDK is in PATH
dart --version

# Check DAP configuration
:lua print(vim.inspect(require('dap').configurations.dart))
```

## Updating

```bash
cd ~/.config/nvim

# Update plugins
nvim --headless "+Lazy! sync" +qa

# Update Mason tools
nvim --headless "+MasonUpdate" +qa

# Update npm/pip packages
npm update -g prettier live-server
pip3 install --upgrade black
```

## Further Considerations

### Optional: FVM (Flutter Version Management)
If working with multiple Flutter versions per project:
```bash
brew install fvm
cd your-flutter-project
fvm use 3.16.0
```
flutter-tools.nvim has `fvm = true` enabled and will auto-detect FVM.

### Optional: Additional Language Support
To add more languages:
1. Add LazyVim extras in [lua/plugins/init.lua](lua/plugins/init.lua):
   ```lua
   { import = "lazyvim.plugins.extras.lang.rust" },
   { import = "lazyvim.plugins.extras.lang.go" },
   ```
2. Add Mason tools in mason.nvim opts:
   ```lua
   ensure_installed = {"stylua", "rust-analyzer", "gopls", ...}
   ```

### Optional: GitHub Copilot
Already configured via `github/copilot.vim`. To activate:
```bash
# Inside Neovim
:Copilot setup
```

### Optional: CodeCompanion (AI Assistant)
Already configured via `olimorris/codecompanion.nvim`. Configure API keys as needed.

## Resources

- [LazyVim Documentation](https://www.lazyvim.org/)
- [Flutter Tools Plugin](https://github.com/nvim-flutter/flutter-tools.nvim)
- [Neovim LSP Guide](https://neovim.io/doc/user/lsp.html)
- [Mason Registry](https://mason-registry.dev/)
