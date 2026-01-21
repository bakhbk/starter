-- Which-key configuration with IDEA-style groups
return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    if not opts.spec then
      opts.spec = {}
    end

    -- Extend spec with custom groups
    vim.list_extend(opts.spec, {
      -- Main groups
      { "<leader><leader>", desc = "Command Palette", icon = "" },

      -- Flutter operations (moved to <leader>F to avoid conflict)
      { "<leader>F", group = "flutter", icon = "" },
      { "<leader>Fr", desc = "Run", icon = "" },
      { "<leader>Fq", desc = "Quit", icon = "" },
      { "<leader>FR", desc = "Restart", icon = "" },
      { "<leader>Fl", desc = "Reload", icon = "" },
      { "<leader>Fd", desc = "Devices", icon = "" },
      { "<leader>Fe", desc = "Emulators", icon = "" },
      { "<leader>Fo", desc = "Outline", icon = "" },
      { "<leader>Ft", desc = "DevTools", icon = "" },
      { "<leader>FL", desc = "Clear Log", icon = "" },
      { "<leader>Fp", desc = "Pub Get", icon = "󰏗" },

      -- Symbol/Search operations
      { "<leader>s", group = "search/symbols", icon = "" },
      { "<leader>ss", desc = "Workspace Symbols", icon = "" },
      { "<leader>so", desc = "Document Symbols", icon = "" },

      -- Code operations
      { "<leader>c", group = "code", icon = "" },
      { "<leader>ca", desc = "Code Actions", icon = "💡" },
      { "<leader>cf", desc = "Format", icon = "" },
      { "<leader>cp", desc = "Code Action Preview", icon = "" },

      -- Rename operations
      { "<leader>r", group = "rename", icon = "" },
      { "<leader>rn", desc = "Rename", icon = "" },
      { "<leader>ri", desc = "Incremental Rename", icon = "" },

      -- Markdown
      { "<leader>m", group = "markdown", icon = "📝" },
      { "<leader>mp", desc = "Preview (buffer)", icon = "" },
      { "<leader>mb", desc = "Preview (browser)", icon = "" },

      -- Package management
      { "<leader>p", group = "package", icon = "󰏗" },
      { "<leader>ps", desc = "Show Versions", icon = "" },
      { "<leader>pu", desc = "Update", icon = "" },
      { "<leader>pd", desc = "Delete", icon = "" },
      { "<leader>pi", desc = "Install", icon = "" },

      -- Session/Quit
      { "<leader>q", group = "quit/session", icon = "" },
      { "<leader>qs", desc = "Restore Session", icon = "" },
      { "<leader>ql", desc = "Last Session", icon = "" },
      { "<leader>qd", desc = "Don't Save", icon = "" },

      -- UI/View controls
      { "<leader>1", desc = "Explorer", icon = "" },
      { "<leader>2", desc = "Diagnostics", icon = "" },
      { "<leader>3", desc = "Git Status", icon = "" },
      { "<leader>4", desc = "Terminal", icon = "" },

      -- Navigation
      { "<leader>[", desc = "Navigate Back", icon = "" },
      { "<leader>]", desc = "Navigate Forward", icon = "" },
    })

    return opts
  end,
}
