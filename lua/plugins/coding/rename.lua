return {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
    keys = {{
        "<leader>ri",
        function()
            return ":IncRename " .. vim.fn.expand("<cword>")
        end,
        expr = true,
        desc = "Incremental Rename"
    }}
}
