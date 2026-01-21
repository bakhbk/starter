return {
    "nvim-lua/plenary.nvim",
    keys = {{
        "<leader>ls",
        function()
            if vim.fn.executable("live-server") == 0 then
                vim.notify("live-server not found. Install with: npm install -g live-server", vim.log.levels.ERROR)
                return
            end
            vim.fn.jobstart("live-server", {
                detach = true
            })
            vim.notify("Live server started", vim.log.levels.INFO)
        end,
        desc = "Start Live Server"
    }}
}
