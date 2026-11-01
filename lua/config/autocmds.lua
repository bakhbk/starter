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

-- Markdown: читаемость таблиц и отсутствие шума
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt.wrap = true          -- длинные строки всё равно переносятся
        vim.opt.textwidth = 0        -- не ломать таблицы переносом
        vim.opt.spell = false        -- красные волнистые подчёркивания
        vim.opt.list = true          -- показывать trailing пробелы
        pcall(vim.cmd, "RenderMarkdown enable")
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
