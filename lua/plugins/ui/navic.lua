return {
    "SmiteshP/nvim-navic",
    event = "LspAttach",
    opts = {
        lsp = {
            auto_attach = true
        },
        highlight = true,
        separator = " > ",
        depth_limit = 5,
        lazy_update_context = true
    }
}
