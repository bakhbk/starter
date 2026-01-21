-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Quick escape from insert mode
map("i", "jj", "<ESC>", { desc = "Exit insert mode" })

-- IDEA/IntelliJ-like shortcuts for terminal/SSH compatibility
-- Note: LazyVim has excellent defaults, we only add non-conflicting shortcuts

-- Command Palette (LazyVim uses <leader><leader> for flash, we override for IDEA compatibility)
map("n", "<leader>fC", "<cmd>Telescope commands<cr>", { desc = "Find Commands" })

-- Symbol navigation (using LazyVim's search group)
-- <leader>ss already exists in LazyVim for symbols
-- <leader>sS for workspace symbols (capital S to avoid conflict)
map("n", "<leader>sS", "<cmd>Telescope lsp_workspace_symbols<cr>", { desc = "Workspace Symbols" })

-- File operations (LazyVim already has excellent defaults)
-- <leader>ff - find files (LazyVim default)
-- <leader>fr - recent files (LazyVim default) 
-- <leader>fg - live grep (LazyVim default)
-- <leader>fb - buffers (LazyVim default)

-- Code actions - LazyVim already has <leader>ca and format on save
-- We only add if not already defined
if not vim.fn.mapcheck("<leader>ca", "n") then
  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
end

-- Navigation shortcuts (using safe bindings)
map("n", "<leader>bh", "<C-o>", { desc = "Navigate Back" })
map("n", "<leader>bl", "<C-i>", { desc = "Navigate Forward" })

-- View controls (using explicit commands instead of numbers)
-- LazyVim has <leader>e for explorer already
map("n", "<leader>E", "<cmd>Neotree toggle<cr>", { desc = "Explorer (NeoTree)" })
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>gg", "<cmd>Telescope git_status<cr>", { desc = "Git Status" })
map("n", "<leader>ft", "<cmd>ToggleTerm<cr>", { desc = "Terminal" })

-- Line movement (IntelliJ-style) - these don't conflict
map("n", "<A-Up>", ":m .-2<CR>==", { desc = "Move Line Up" })
map("n", "<A-Down>", ":m .+1<CR>==", { desc = "Move Line Down" })
map("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move Selection Up" })
map("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move Selection Down" })

-- Duplicate line (use capital D to avoid conflicts)
map("n", "<leader>D", "yyp", { desc = "Duplicate Line" })
map("v", "<leader>D", "y'>pgv", { desc = "Duplicate Selection" })
