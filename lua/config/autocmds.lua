-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Auto-save for Dart files (Flutter hot reload)
vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
  pattern = "*.dart",
  callback = function()
    if vim.bo.modified then
      vim.defer_fn(function()
        if vim.bo.modified then
          vim.cmd("silent! write")
        end
      end, 1000) -- 1 second debounce
    end
  end,
  desc = "Auto-save Dart files for Flutter hot reload",
})

-- Note: LazyVim already has format on save enabled via conform.nvim
-- If you need custom format on save behavior, configure it in lua/plugins/conform.lua
