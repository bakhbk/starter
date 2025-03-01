vim.api.nvim_create_user_command("LiveServer", function()
  vim.fn.jobstart("live-server", { detach = true })
end, {})

vim.api.nvim_set_keymap("n", "<leader>ls", ":LiveServer<CR>", { noremap = true, silent = true })
return {}
