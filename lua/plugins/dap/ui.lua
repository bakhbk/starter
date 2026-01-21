return {
    "rcarriga/nvim-dap-ui",
    dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
    keys = {{
        "<leader>du",
        function()
            require("dapui").toggle()
        end,
        desc = "DAP UI Toggle"
    }, {
        "<leader>de",
        function()
            require("dapui").eval()
        end,
        mode = {"n", "v"},
        desc = "DAP Eval"
    }},
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        dapui.setup({
            layouts = {{
                elements = {{
                    id = "scopes",
                    size = 0.25
                }, {
                    id = "breakpoints",
                    size = 0.25
                }, {
                    id = "stacks",
                    size = 0.25
                }, {
                    id = "watches",
                    size = 0.25
                }},
                size = 40,
                position = "left"
            }, {
                elements = {"repl", "console"},
                size = 10,
                position = "bottom"
            }}
        })

        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end
    end
}
