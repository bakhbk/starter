return {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {{
        [[<C-\>]],
        "<cmd>ToggleTerm<cr>",
        desc = "Toggle Terminal"
    }},
    cmd = {"ToggleTerm", "TermExec"},
    opts = {
        size = 15,
        open_mapping = [[<C-\>]],
        shade_terminals = true,
        direction = "horizontal",
        persist_size = true,
        start_in_insert = true
    }
}
