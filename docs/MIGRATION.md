# LazyVim Clean Install - Migration Notes

## What was migrated from previous config

### ✅ Critical Plugins Transferred
1. **flutter-tools.nvim** - Complete Flutter/Dart development
2. **nvim-dap** - Debugging with Dart adapter
3. **neotest-dart** - Testing framework
4. **package-info.nvim** - pubspec.yaml version management
5. **nvim-navic** - Breadcrumbs in statusline
6. **copilot.vim** - GitHub Copilot
7. **codecompanion.nvim** - AI assistant
8. **monokai-pro.nvim** - Theme
9. **render-markdown.nvim** - In-buffer markdown preview
10. **toggleterm.nvim** - Terminal integration
11. **persistence.nvim** - Session management
12. **git-conflict.nvim** - Conflict resolution
13. **inc-rename.nvim** - Live rename preview
14. **nvim-lightbulb** - Code action indicator
15. **actions-preview.nvim** - Code action preview

### 📝 Configuration Files
- **options.lua** - Text wrapping, clipboard, scrolling, persistent undo
- **keymaps.lua** - `jj` escape + IDEA-style shortcuts
- **autocmds.lua** - Auto-save for Dart files (Flutter hot reload)
- **conform.lua** - Format on save configuration
- **which-key.lua** - All command groups and descriptions

### 🎹 Keybindings Preserved
All Flutter commands available at `<leader>F*`:
- `<leader>Fr` - Flutter Run
- `<leader>Fq` - Flutter Quit
- `<leader>FR` - Flutter Restart
- `<leader>Fl` - Flutter Reload
- And more... (see KEYBINDINGS.md)

IDEA-style shortcuts:
- `<leader><leader>` - Command Palette
- `<leader>ss` - Workspace Symbols
- `<leader>1-4` - View controls
- `Alt+Up/Down` - Move lines
- And more...

## What was removed (available in LazyVim)

These plugins were replaced by LazyVim defaults:
- **nvim-cmp** → LazyVim uses blink.cmp by default
- **mini.pairs** → LazyVim includes this
- **nerdcommenter** → LazyVim uses ts-comments
- **trouble.nvim** → Already in LazyVim
- **telescope.nvim** → Already in LazyVim
- **mason.nvim** → Already in LazyVim
- **nvim-treesitter** → Already in LazyVim
- **gitsigns.nvim** → Already in LazyVim
- **neo-tree.nvim** → Already in LazyVim
- **lualine.nvim** → Already in LazyVim

## Next Steps

1. **First launch:** Run `nvim` - LazyVim will install all plugins automatically
2. **Check health:** Run `:checkhealth` to verify everything works
3. **Install Mason tools:** `:Mason` then press `i` to install: dart-debug-adapter, prettier, black, stylua
4. **Test Flutter:** Open a Flutter project and try:
   - `<leader>Fr` to run
   - `gd` to go to definition
   - `<leader>ca` for code actions
   - `F5` to start debugging
5. **Configure Copilot:** Run `:Copilot setup` if needed

## Backup Location

Your previous config is saved at: `~/.config/nvim.backup`

To restore it:
```bash
rm -rf ~/.config/nvim
mv ~/.config/nvim.backup ~/.config/nvim
```

## Documentation

See `docs/KEYBINDINGS.md` for complete keyboard shortcuts reference.

---
**Migration Date:** 21 января 2026 г.
