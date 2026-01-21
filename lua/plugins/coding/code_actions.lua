return {{
    "kosayoda/nvim-lightbulb",
    event = "LspAttach",
    opts = {
        sign = {
            enabled = true,
            text = "💡",
            hl = "DiagnosticSignInfo"
        },
        autocmd = {
            enabled = true,
            updatetime = 200
        }
    }
}, {
    "aznhe21/actions-preview.nvim",
    event = "LspAttach",
    dependencies = {"nvim-telescope/telescope.nvim"},
    keys = {{
        "<leader>cp",
        function()
            require("actions-preview").code_actions()
        end,
        mode = {"n", "v"},
        desc = "Code Action (Preview)"
    }}
}}
