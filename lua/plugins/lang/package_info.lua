return {
    "vuki656/package-info.nvim",
    dependencies = {"MunifTanjim/nui.nvim"},
    ft = "yaml",
    config = function()
        require("package-info").setup({
            package_manager = "flutter"
        })
    end,
    keys = {{
        "<leader>ps",
        function()
            require("package-info").show()
        end,
        desc = "Show package versions"
    }, {
        "<leader>pu",
        function()
            require("package-info").update()
        end,
        desc = "Update package"
    }, {
        "<leader>pd",
        function()
            require("package-info").delete()
        end,
        desc = "Delete package"
    }, {
        "<leader>pi",
        function()
            require("package-info").install()
        end,
        desc = "Install package"
    }}
}
