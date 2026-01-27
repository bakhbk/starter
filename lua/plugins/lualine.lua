return {
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    event = "VeryLazy",
    opts = function(_, opts)
      -- preserve existing user customizations if present
      opts = opts or {}

      -- ensure basic sections exist
      opts.sections = opts.sections or {}
      opts.sections.lualine_x = opts.sections.lualine_x or {}

      -- add small emoji indicator as in example
      table.insert(opts.sections.lualine_x, 1, function()
        return "😄"
      end)

      -- winbar integration with navic for breadcrumbs
      opts.winbar = {
        lualine_c = {
          {
            "navic",
            color_correction = "dynamic",
            navic_opts = {
              separator = " > ",
            },
          },
        },
      }

      opts.inactive_winbar = {
        lualine_c = { "filename" },
      }

      return opts
    end,
  },
}
