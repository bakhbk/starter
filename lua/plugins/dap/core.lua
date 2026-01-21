return {
    "mfussenegger/nvim-dap",
    dependencies = {"nvim-neotest/nvim-nio"},
    keys = {{
        "<F5>",
        function()
            require("dap").continue()
        end,
        desc = "DAP Continue"
    }, {
        "<F10>",
        function()
            require("dap").step_over()
        end,
        desc = "DAP Step Over"
    }, {
        "<F11>",
        function()
            require("dap").step_into()
        end,
        desc = "DAP Step Into"
    }, {
        "<F12>",
        function()
            require("dap").step_out()
        end,
        desc = "DAP Step Out"
    }},
    config = function()
        local dap = require("dap")

        dap.adapters.dart = {
            type = "executable",
            command = "dart",
            args = {"debug_adapter"}
        }

        dap.configurations.dart = {{
            type = "dart",
            request = "launch",
            name = "Launch Dart",
            program = "${file}",
            cwd = "${workspaceFolder}"
        }}
    end
}
