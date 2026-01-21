return {
    "nvim-neotest/neotest",
    dependencies = {"nvim-neotest/nvim-nio", "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter",
                    "sidlatau/neotest-dart"},
    keys = {{
        "<leader>tt",
        function()
            require("neotest").run.run()
        end,
        desc = "Run Nearest Test"
    }, {
        "<leader>tf",
        function()
            require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "Run File Tests"
    }, {
        "<leader>td",
        function()
            require("neotest").run.run({
                strategy = "dap"
            })
        end,
        desc = "Debug Nearest Test"
    }, {
        "<leader>ts",
        function()
            require("neotest").summary.toggle()
        end,
        desc = "Toggle Test Summary"
    }, {
        "<leader>to",
        function()
            require("neotest").output.open({
                enter = true
            })
        end,
        desc = "Show Test Output"
    }, {
        "<leader>tO",
        function()
            require("neotest").output_panel.toggle()
        end,
        desc = "Toggle Output Panel"
    }},
    config = function()
        require("neotest").setup({
            adapters = {require("neotest-dart")({
                command = "flutter",
                use_lsp = true
            })},
            icons = {
                running_animated = {"⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏"}
            }
        })
    end
}
