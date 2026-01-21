return {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {
        dir = vim.fn.stdpath("state") .. "/sessions/",
        options = {"buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp"}
    },
    keys = {
        {
            "<leader>q", 
            group = "quit/session",
            icon = ""
        },
        {
            "<leader>qs",
            function()
                require("persistence").load()
            end,
            desc = "Restore Session"
        },
        {
            "<leader>ql",
            function()
                require("persistence").load({last = true})
            end,
            desc = "Restore Last Session"
        },
        {
            "<leader>qd",
            function()
                require("persistence").stop()
            end,
            desc = "Don't Save Current Session"
        }
    }
}
