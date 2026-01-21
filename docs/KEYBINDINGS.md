# Neovim Keybindings - IDEA/IntelliJ Style

Горячие клавиши адаптированы под IntelliJ IDEA / Android Studio для привычного workflow.

## 📌 Важно

- **Leader key:** `<Space>` (пробел)
- **GUI команды (⌘):** Работают в GUI Neovim (Neovide, VimR) или современных терминалах (Alacritty, WezTerm, iTerm2 с настройкой)
- **Терминальные альтернативы:** Все команды доступны через `<leader>` префикс для работы на серверах через SSH

## 🔍 Navigation (Go To...)

| IntelliJ | Neovim GUI | Neovim Terminal | Действие |
|----------|------------|-----------------|----------|
| `⌘⇧A` | `Cmd+Shift+A` | `<Space><Space>` | **Find Action** - Command Palette |
| `⌘O` | `Cmd+O` | `<Space>ss` | **Go to Symbol** - Workspace symbols |
| `⌘⇧O` | `Cmd+Shift+O` | `<Space>ff` | **Go to File** - Find files |
| `⌘E` | `Cmd+E` | `<Space>fr` | **Recent Files** |
| `⌘⇧E` | `Cmd+Shift+E` | `<Space>fb` | **Recent Buffers** |
| `⌘F12` | `Cmd+F12` | `<Space>so` | **File Structure** - Document symbols |
| `⌘⇧F` | `Cmd+Shift+F` | `<Space>fg` | **Find in Project** - Live grep |
| `⌘B` | `Cmd+B` | `gd` | **Go to Definition** |
| `⌘⌥B` | `Cmd+Alt+B` | `gi` | **Go to Implementation** |
| `⌘U` | `Cmd+U` | `gD` | **Go to Declaration** |
| `⌘⌥←` | `Cmd+Alt+Left` | `<Space>[` | **Navigate Back** |
| `⌘⌥→` | `Cmd+Alt+Right` | `<Space>]` | **Navigate Forward** |

### LSP Navigation (работают везде)

| Клавиша | Действие |
|---------|----------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Go to references |
| `gi` | Go to implementation |
| `K` | Show documentation (hover) |

## ✏️ Editing & Code Actions

| IntelliJ | Neovim GUI | Neovim Terminal | Действие |
|----------|------------|-----------------|----------|
| `⌘/` | `Cmd+/` | `<Space>/` | **Toggle Comment** |
| `⌥⏎` | `Alt+Enter` | `<Space>ca` | **Code Actions** (Quick Fix) |
| `⇧F6` | `Shift+F6` | `<Space>rn` | **Rename Symbol** |
| `⌘⌥L` | `Cmd+Alt+L` | `<Space>cf` | **Reformat Code** |
| `⌘P` | `Cmd+P` | `Ctrl+P` (insert) | **Parameter Info** |
| `⌘⇧I` | `Cmd+Shift+I` | `K` | **Quick Definition** |
| `⌘⇧↑/↓` | `Cmd+Shift+Up/Down` | - | **Move Line/Selection** |
| `⌘D` | `Cmd+D` | `yyp` | **Duplicate Line** |

### Additional Code Commands

| Клавиша | Действие |
|---------|----------|
| `<Space>cp` | Code action preview (via Telescope) |
| `<Space>ri` | Incremental rename (live preview) |
| `<Space>cc` | Comment lines |
| `<Space>cu` | Uncomment lines |

## 🔎 Search & Replace

| IntelliJ | Neovim GUI | Neovim Terminal | Действие |
|----------|------------|-----------------|----------|
| `⌘F` | `Cmd+F` | `/` | **Find in File** |
| `⌘R` | `Cmd+R` | `:%s/` | **Replace in File** |
| `⌘⇧R` | `Cmd+Shift+R` | `<Space>sr` | **Replace in Project** |

## ▶️ Run & Debug (Flutter)

| IntelliJ | Neovim GUI | Neovim Terminal | Действие |
|----------|------------|-----------------|----------|
| `⇧F10` | `Shift+F10` | `<Space>Fr` | **Run** (FlutterRun) |
| `⇧F9` | `Shift+F9` | `<F5>` | **Debug** |
| `^F5` | `Ctrl+F5` | `<Space>Fq` | **Stop** (FlutterQuit) |
| `⌘F9` | `Cmd+F9` | `<Space>Fp` | **Build** (Pub Get) |

### Flutter Commands (`<Space>F*`)

| Клавиша | Действие |
|---------|----------|
| `<Space>Fr` | Flutter Run |
| `<Space>Fq` | Flutter Quit |
| `<Space>FR` | Flutter Restart (full restart) |
| `<Space>Fl` | Flutter Reload (hot reload) |
| `<Space>Fd` | Flutter Devices |
| `<Space>Fe` | Flutter Emulators |
| `<Space>Fo` | Flutter Outline |
| `<Space>Ft` | Flutter DevTools |
| `<Space>FL` | Flutter Clear Log |
| `<Space>Fp` | Flutter Pub Get |

### Debug Controls

| Клавиша | Действие |
|---------|----------|
| `F5` | Continue / Start debug |
| `F10` | Step over |
| `F11` | Step into |
| `F12` | Step out |
| `<Space>du` | Toggle DAP UI |
| `<Space>de` | Evaluate expression |

## 🧪 Testing

| Клавиша | Действие |
|---------|----------|
| `<Space>tt` | Run nearest test |
| `<Space>tf` | Run file tests |
| `<Space>td` | Debug nearest test |
| `<Space>ts` | Toggle test summary |
| `<Space>to` | Show test output |
| `<Space>tO` | Toggle output panel |

## 🐛 Diagnostics & Errors

| IntelliJ | Neovim | Действие |
|----------|--------|----------|
| `F2` | `F2` | **Next Error** |
| `⇧F2` | `Shift+F2` | **Previous Error** |
| - | `<Space>xx` | **Show All Diagnostics** |
| - | `<Space>xX` | **Buffer Diagnostics** |

## 🪟 View Controls & Tool Windows

| IntelliJ | Neovim GUI | Neovim Terminal | Действие |
|----------|------------|-----------------|----------|
| `⌘1` | `Cmd+1` | `<Space>1` / `<Space>e` | **Project Explorer** |
| `⌥1` | `Alt+1` | `<Space>e` | **Toggle Explorer** |
| - | - | `<Space>2` | **Diagnostics** (Trouble) |
| - | - | `<Space>3` | **Git Status** |
| - | - | `<Space>4` | **Terminal** |
| - | - | `<Space>5` | **Debug UI** |

## 🔧 Refactoring

| IntelliJ | Neovim GUI | Neovim Terminal | Действие |
|----------|------------|-----------------|----------|
| `^T` | `Ctrl+T` | `<Space>ca` | **Refactor This** |
| `⌘⌥M` | `Cmd+Alt+M` (visual) | `<Space>ca` | **Extract Method** |
| `⌘⌥V` | `Cmd+Alt+V` (visual) | `<Space>ca` | **Extract Variable** |

## 🌳 Git

| IntelliJ | Neovim GUI | Neovim Terminal | Действие |
|----------|------------|-----------------|----------|
| `⌘K` | `Cmd+K` | `<Space>gc` | **Git Commits** |
| - | - | `<Space>gb` | **Git Branches** |
| - | - | `<Space>gs` | **Git Status** |
| - | - | `<Space>gf` | **File History** |

## 📦 Additional Features

### Markdown

| Клавиша | Действие |
|---------|----------|
| `<Space>mp` | Preview in buffer |
| `<Space>mb` | Preview in browser |

### Package Management (pubspec.yaml)

| Клавиша | Действие |
|---------|----------|
| `<Space>ps` | Show package versions |
| `<Space>pu` | Update package |
| `<Space>pd` | Delete package |
| `<Space>pi` | Install package |

### Session Management

| Клавиша | Действие |
|---------|----------|
| `<Space>qs` | Restore session |
| `<Space>ql` | Restore last session |
| `<Space>qd` | Don't save current session |

### Terminal

| Клавиша | Действие |
|---------|----------|
| `Ctrl+\` | Toggle terminal |

### Utilities

| Клавиша | Действие |
|---------|----------|
| `<Space>ls` | Start live-server (web dev) |
| `jj` | Exit insert mode |

## 📚 LazyVim Defaults

Полная документация базовых LazyVim клавиш: [LazyVim Keymaps](https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua)

### Важные базовые LazyVim биндинги

| Клавиша | Действие |
|---------|----------|
| `<leader>l` | Lazy plugin manager |
| `<leader>:` | Command history |
| `<leader>gg` | Lazygit (если установлен) |
| `[d` / `]d` | Previous/Next diagnostic |
| `[t` / `]t` | Previous/Next todo comment |
| `<C-/>` | Toggle terminal (альтернатива) |

## 🔄 Vim Motions (основы)

Если не знакомы с Vim motions:

| Клавиша | Действие |
|---------|----------|
| `h/j/k/l` | ←/↓/↑/→ навигация |
| `w/b` | Next/previous word |
| `0/$` | Start/end of line |
| `gg/G` | Start/end of file |
| `i/a` | Insert before/after cursor |
| `o/O` | New line below/above |
| `v/V` | Visual mode / Visual line |
| `y/p` | Copy (yank) / Paste |
| `d` | Delete (cut) |
| `u` | Undo |
| `Ctrl+r` | Redo |
| `.` | Repeat last command |

## 💡 Tips

1. **Нажмите `<Space>`** и подождите 200ms — откроется Which-Key меню со всеми доступными командами
2. **Command Palette:** `<Space><Space>` — аналог `Cmd+Shift+A` в IntelliJ
3. **Telescope everywhere:** Большинство Go To команд реализованы через Telescope (fzf)
4. **LSP автоматический:** При открытии Dart/Flutter файлов LSP подключается автоматически
5. **Format on save:** Включен автоформат при сохранении (3s timeout)
6. **Auto-save для Dart:** Автосохранение каждую секунду для Flutter hot reload
7. **Для серверов:** Все GUI команды (`Cmd+...`) имеют альтернативы через `<leader>`

## 🚀 Quick Start

### Первые шаги после установки

1. Откройте Neovim: `nvim`
2. Нажмите `<Space>` → увидите все доступные команды
3. `<Space>ff` → найти файл
4. `<Space>fg` → поиск по содержимому
5. `<Space><Space>` → command palette
6. `<Space>e` → открыть/закрыть explorer

### Flutter Development

1. Откройте Flutter проект: `nvim .`
2. Откройте Dart файл
3. `<Space>Fr` или `Shift+F10` → запустить Flutter
4. Редактируйте код → автосохранение → hot reload
5. `F5` → начать отладку с breakpoints
6. `<Space>tt` → запустить тесты

## 📖 Additional Resources

- [LazyVim Documentation](https://www.lazyvim.org/)
- [Flutter Tools Plugin](https://github.com/nvim-flutter/flutter-tools.nvim)
- [Telescope Documentation](https://github.com/nvim-telescope/telescope.nvim)
- [Which-Key Plugin](https://github.com/folke/which-key.nvim)

---

**Конфигурация обновлена:** 21 января 2026 г.
