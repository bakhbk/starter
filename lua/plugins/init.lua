return {{'olimorris/codecompanion.nvim'}, {"github/copilot.vim"}, {"loctvl842/monokai-pro.nvim"}, {
    "LazyVim/LazyVim",
    opts = {
        colorscheme = "monokai-pro"
    }
}, {
    "folke/trouble.nvim",
    opts = {
        use_diagnostic_signs = true
    },
    keys = {{
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)"
    }, {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)"
    }, {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)"
    }, {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)"
    }}
}, {
    "hrsh7th/nvim-cmp",
    dependencies = {"hrsh7th/cmp-emoji", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip"},
    opts = function(_, opts)
        local luasnip = require("luasnip")
        opts.snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end
        }
        table.insert(opts.sources, {
            name = "luasnip"
        })
        table.insert(opts.sources, {
            name = "emoji"
        })
    end
}, {
    "nvim-telescope/telescope.nvim",
    keys = { -- add a keymap to browse plugin files
    -- stylua: ignore
    {
        "<leader>fp",
        function()
            require("telescope.builtin").find_files({
                cwd = require("lazy.core.config").options.root
            })
        end,
        desc = "Find Plugin File"
    }},
    -- change some options
    opts = {
        defaults = {
            layout_strategy = "horizontal",
            layout_config = {
                prompt_position = "top"
            },
            sorting_strategy = "ascending",
            winblend = 0
        }
    }
}, {
    "neovim/nvim-lspconfig",
    opts = {
        servers = {
            pyright = {}
        }
    }
}, {
    import = "lazyvim.plugins.extras.lang.typescript"
}, {
    "nvim-treesitter/nvim-treesitter",
    opts = {
        ensure_installed = {"bash", "html", "javascript", "json", "lua", "markdown", "markdown_inline", "python",
                            "query", "regex", "tsx", "typescript", "vim", "dart", "yaml"}
    }
}, {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
        table.insert(opts.sections.lualine_x, {function()
            return "😄"
        end})

        -- Add navic breadcrumbs to winbar
        opts.winbar = {
            lualine_c = {{
                "navic",
                color_correction = "dynamic",
                navic_opts = {
                    separator = " > "
                }
            }}
        }
        opts.inactive_winbar = {
            lualine_c = {"filename"}
        }
    end
}, {
    import = "lazyvim.plugins.extras.ui.mini-starter"
}, {
    import = "lazyvim.plugins.extras.lang.json"
}, {
    "mason-org/mason.nvim",
    opts = {
        ensure_installed = {"stylua", "shellcheck", "shfmt", "flake8", "prettier", "black"}
    }
}, {

    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            dart = {"dart_format"},
            lua = {"stylua"},
            python = {"black"},
            jsx = {"prettier"},
            javascript = {"prettier"},
            javascriptreact = {"prettier"},
            typescript = {"prettier"},
            typescriptreact = {"prettier"},
            flow = {"prettier"},
            vue = {"prettier"},
            angular = {"prettier"},
            css = {"prettier"},
            less = {"prettier"},
            scss = {"prettier"},
            html = {"prettier"},
            handlebars = {"prettier"},
            json = {"prettier"},
            yaml = {"prettier"},
            graphql = {"prettier"},
            markdown = {"prettier"},
            mdx = {"prettier"}
        },
        formatters = {
            dart_format = {
                timeout_ms = 3000
            },
            prettier = {
                args = {"--stdin-filepath", "$FILENAME"}
            }
        }
    }
}}
