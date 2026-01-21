return {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {"nvim-lua/plenary.nvim", "stevearc/dressing.nvim", "mfussenegger/nvim-dap"},
    config = function()
        require("flutter-tools").setup({
            ui = {
                border = "rounded",
                notification_style = "native"
            },
            decorations = {
                statusline = {
                    app_version = true,
                    device = true,
                    project_config = true
                }
            },
            debugger = {
                enabled = true,
                exception_breakpoints = {},
                evaluate_to_string_in_debug_views = true
            },
            root_patterns = {".git", "pubspec.yaml"},
            fvm = true,
            widget_guides = {
                enabled = true
            },
            closing_tags = {
                highlight = "ErrorMsg",
                prefix = ">",
                priority = 10,
                enabled = true
            },
            dev_log = {
                enabled = true,
                filter = nil,
                notify_errors = true,
                open_cmd = "15split",
                focus_on_open = true
            },
            dev_tools = {
                autostart = true,
                auto_open_browser = false
            },
            outline = {
                open_cmd = "30vnew",
                auto_open = false
            },
            lsp = {
                color = {
                    enabled = true,
                    background = false,
                    background_color = nil,
                    foreground = false,
                    virtual_text = true,
                    virtual_text_str = "■"
                },
                settings = {
                    showTodos = true,
                    completeFunctionCalls = true,
                    renameFilesWithClasses = "prompt",
                    enableSnippets = true,
                    updateImportsOnRename = true
                },
                on_attach = function(client, bufnr)
                    local opts = {
                        buffer = bufnr,
                        noremap = true,
                        silent = true
                    }

                    -- Attach navic for breadcrumbs
                    if client.server_capabilities.documentSymbolProvider then
                        require("nvim-navic").attach(client, bufnr)
                    end

                    -- LSP Navigation
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

                    -- Code Actions
                    vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

                    -- Flutter Commands
                    vim.keymap.set("n", "<leader>fr", "<cmd>FlutterRun<cr>", vim.tbl_extend("force", opts, {
                        desc = "Flutter Run"
                    }))
                    vim.keymap.set("n", "<leader>fq", "<cmd>FlutterQuit<cr>", vim.tbl_extend("force", opts, {
                        desc = "Flutter Quit"
                    }))
                    vim.keymap.set("n", "<leader>fR", "<cmd>FlutterRestart<cr>", vim.tbl_extend("force", opts, {
                        desc = "Flutter Restart"
                    }))
                    vim.keymap.set("n", "<leader>fl", "<cmd>FlutterReload<cr>", vim.tbl_extend("force", opts, {
                        desc = "Flutter Reload"
                    }))
                    vim.keymap.set("n", "<leader>fd", "<cmd>FlutterDevices<cr>", vim.tbl_extend("force", opts, {
                        desc = "Flutter Devices"
                    }))
                    vim.keymap.set("n", "<leader>fe", "<cmd>FlutterEmulators<cr>", vim.tbl_extend("force", opts, {
                        desc = "Flutter Emulators"
                    }))
                    vim.keymap.set("n", "<leader>fo", "<cmd>FlutterOutlineToggle<cr>", vim.tbl_extend("force", opts, {
                        desc = "Flutter Outline"
                    }))
                    vim.keymap.set("n", "<leader>ft", "<cmd>FlutterDevTools<cr>", vim.tbl_extend("force", opts, {
                        desc = "Flutter DevTools"
                    }))
                    vim.keymap.set("n", "<leader>fL", "<cmd>FlutterLogClear<cr>", vim.tbl_extend("force", opts, {
                        desc = "Flutter Clear Log"
                    }))
                    vim.keymap.set("n", "<leader>fp", "<cmd>FlutterPubGet<cr>", vim.tbl_extend("force", opts, {
                        desc = "Flutter Pub Get"
                    }))
                end
            }
        })
    end
}
