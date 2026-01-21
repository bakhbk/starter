return { -- Render markdown directly in Neovim buffer
{
    "MeanderingProgrammer/render-markdown.nvim",
    ft = "markdown",
    dependencies = {"nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons"},
    opts = {
        heading = {
            enabled = true,
            sign = true,
            icons = {"󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 "}
        },
        code = {
            enabled = true,
            sign = true,
            style = "full",
            left_pad = 2,
            right_pad = 2,
            width = "block",
            border = "thin"
        },
        bullet = {
            enabled = true,
            icons = {"●", "○", "◆", "◇"}
        },
        checkbox = {
            enabled = true,
            unchecked = {
                icon = "󰄱 "
            },
            checked = {
                icon = "󰱒 "
            }
        },
        quote = {
            enabled = true,
            icon = "▎"
        },
        link = {
            enabled = true,
            image = "󰥶 ",
            hyperlink = "󰌹 "
        }
    },
    keys = {{
        "<leader>mp",
        "<cmd>RenderMarkdown toggle<cr>",
        desc = "Preview (in buffer)"
    }}
}, -- Alternative: Open preview in browser (more traditional)
{
    "iamcco/markdown-preview.nvim",
    cmd = {"MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop"},
    ft = "markdown",
    build = function()
        vim.fn["mkdp#util#install"]()
    end,
    keys = {{
        "<leader>mb",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "Preview (browser)"
    }},
    config = function()
        vim.g.mkdp_auto_start = 0
        vim.g.mkdp_auto_close = 1
        vim.g.mkdp_refresh_slow = 0
        vim.g.mkdp_command_for_global = 0
        vim.g.mkdp_open_to_the_world = 0
        vim.g.mkdp_browser = ""
        vim.g.mkdp_echo_preview_url = 1
        vim.g.mkdp_preview_options = {
            mkit = {},
            katex = {},
            uml = {},
            maid = {},
            disable_sync_scroll = 0,
            sync_scroll_type = "middle",
            hide_yaml_meta = 1,
            sequence_diagrams = {},
            flowchart_diagrams = {},
            content_editable = false,
            disable_filename = 0,
            toc = {}
        }
    end
}}

