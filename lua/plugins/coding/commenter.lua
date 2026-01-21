return {
    "preservim/nerdcommenter",
    event = "VeryLazy",
    config = function()
        vim.g.NERDCreateDefaultMappings = 1
        vim.g.NERDSpaceDelims = 1
        vim.g.NERDCompactSexyComs = 1
        vim.g.NERDDefaultAlign = 'left'
        vim.g.NERDCommentEmptyLines = 1
        vim.g.NERDTrimTrailingWhitespace = 1
        vim.g.NERDToggleCheckAllLines = 1
    end,
    keys = {{
        "<leader>/",
        "<Plug>NERDCommenterToggle",
        mode = {"n", "v"},
        desc = "Toggle comment"
    }, {
        "<leader>cc",
        "<Plug>NERDCommenterComment",
        mode = {"n", "v"},
        desc = "Comment lines"
    }, {
        "<leader>cu",
        "<Plug>NERDCommenterUncomment",
        mode = {"n", "v"},
        desc = "Uncomment lines"
    }, {
        "<leader>cs",
        "<Plug>NERDCommenterSexy",
        mode = {"n", "v"},
        desc = "Sexy comment"
    }, {
        "<leader>cy",
        "<Plug>NERDCommenterYank",
        mode = {"n", "v"},
        desc = "Yank then comment"
    }, {
        "<leader>c$",
        "<Plug>NERDCommenterToEOL",
        mode = "n",
        desc = "Comment to EOL"
    }, {
        "<leader>ca",
        "<Plug>NERDCommenterAltDelims",
        mode = {"n", "v"},
        desc = "Use alternative delimiters"
    }}
}
