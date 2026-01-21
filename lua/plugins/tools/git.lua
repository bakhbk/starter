return {
    -- Git integration via Telescope
    {
        "nvim-telescope/telescope.nvim",
        keys = {
            { "<leader>g", group = "git", icon = "" },
            {
                "<leader>gc",
                "<cmd>Telescope git_commits<cr>",
                desc = "Commits"
            },
            {
                "<leader>gb",
                "<cmd>Telescope git_branches<cr>",
                desc = "Branches"
            },
            {
                "<leader>gs",
                "<cmd>Telescope git_status<cr>",
                desc = "Status"
            },
            {
                "<leader>gf",
                "<cmd>Telescope git_bcommits<cr>",
                desc = "File commits"
            }
        }
    }
}
