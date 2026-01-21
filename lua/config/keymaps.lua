-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Quick escape from insert mode
map("i", "jj", "<ESC>", { desc = "Exit insert mode" })

-- IDEA/IntelliJ-like shortcuts for terminal/SSH compatibility
-- Navigation
map("n", "<leader><leader>", "<cmd>Telescope commands<cr>", { desc = "Command Palette" })
map("n", "<leader>ss", "<cmd>Telescope lsp_workspace_symbols<cr>", { desc = "Workspace Symbols" })
map("n", "<leader>so", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Document Symbols" })

-- File operations (LazyVim already has good defaults for <leader>f*)
-- <leader>ff - find files (default)
-- <leader>fr - recent files (default) 
-- <leader>fg - live grep (default)

-- Code actions (enhance defaults)
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
map("n", "<leader>cf", function() 
  vim.lsp.buf.format({ async = true })
end, { desc = "Format Code" })

-- Navigation shortcuts
map("n", "<leader>[", "<C-o>", { desc = "Navigate Back" })
map("n", "<leader>]", "<C-i>", { desc = "Navigate Forward" })

-- View controls
map("n", "<leader>1", "<cmd>Neotree toggle<cr>", { desc = "Explorer" })
map("n", "<leader>2", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics" })
map("n", "<leader>3", "<cmd>Telescope git_status<cr>", { desc = "Git Status" })
map("n", "<leader>4", "<cmd>ToggleTerm<cr>", { desc = "Terminal" })

-- Line movement (IntelliJ-style)
map("n", "<A-Up>", ":m .-2<CR>==", { desc = "Move Line Up" })
map("n", "<A-Down>", ":m .+1<CR>==", { desc = "Move Line Down" })
map("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move Selection Up" })
map("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move Selection Down" })

-- Duplicate line
map("n", "<leader>d", "yyp", { desc = "Duplicate Line" })
map("v", "<leader>d", "y'>pgv", { desc = "Duplicate Selection" })
