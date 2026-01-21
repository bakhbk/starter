-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        require("conform").format({
            bufnr = args.buf,
            timeout_ms = 3000,
            lsp_fallback = true
        })
    end
})

-- Auto-save for Flutter hot reload
vim.api.nvim_create_autocmd({"TextChanged", "TextChangedI"}, {
    pattern = "*.dart",
    callback = function()
        if vim.bo.modified then
            vim.defer_fn(function()
                if vim.bo.modified then
                    vim.cmd("silent! write")
                end
            end, 1000)
        end
    end
})
