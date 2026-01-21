-- Flutter development with debugging and testing support
return {
  -- Flutter Tools - complete Flutter/Dart integration
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    opts = {
      ui = {
        border = "rounded",
        notification_style = "native",
      },
      decorations = {
        statusline = {
          app_version = true,
          device = true,
          project_config = true,
        },
      },
      debugger = {
        enabled = true,
        exception_breakpoints = {},
        evaluate_to_string_in_debug_views = true,
      },
      root_patterns = { ".git", "pubspec.yaml" },
      fvm = true, -- FVM support
      widget_guides = {
        enabled = true,
      },
      closing_tags = {
        highlight = "ErrorMsg",
        prefix = ">",
        priority = 10,
        enabled = true,
      },
      dev_log = {
        enabled = true,
        filter = nil,
        notify_errors = true,
        open_cmd = "15split",
        focus_on_open = true,
      },
      dev_tools = {
        autostart = true,
        auto_open_browser = false,
      },
      outline = {
        open_cmd = "30vnew",
        auto_open = false,
      },
      lsp = {
        color = {
          enabled = true,
          background = false,
          background_color = nil,
          foreground = false,
          virtual_text = true,
          virtual_text_str = "■",
        },
        settings = {
          showTodos = true,
          completeFunctionCalls = true,
          renameFilesWithClasses = "prompt",
          enableSnippets = true,
          updateImportsOnRename = true,
        },
        on_attach = function(client, bufnr)
          local opts = { buffer = bufnr, noremap = true, silent = true }

          -- Attach navic for breadcrumbs
          if client.server_capabilities.documentSymbolProvider then
            require("nvim-navic").attach(client, bufnr)
          end

          -- LSP Navigation (standard Neovim bindings)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

          -- Code Actions
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

          -- Flutter Commands (using <leader>F to avoid conflict with file/find)
          vim.keymap.set("n", "<leader>Fr", "<cmd>FlutterRun<cr>", vim.tbl_extend("force", opts, {
            desc = "Flutter Run",
          }))
          vim.keymap.set("n", "<leader>Fq", "<cmd>FlutterQuit<cr>", vim.tbl_extend("force", opts, {
            desc = "Flutter Quit",
          }))
          vim.keymap.set("n", "<leader>FR", "<cmd>FlutterRestart<cr>", vim.tbl_extend("force", opts, {
            desc = "Flutter Restart",
          }))
          vim.keymap.set("n", "<leader>Fl", "<cmd>FlutterReload<cr>", vim.tbl_extend("force", opts, {
            desc = "Flutter Reload",
          }))
          vim.keymap.set("n", "<leader>Fd", "<cmd>FlutterDevices<cr>", vim.tbl_extend("force", opts, {
            desc = "Flutter Devices",
          }))
          vim.keymap.set("n", "<leader>Fe", "<cmd>FlutterEmulators<cr>", vim.tbl_extend("force", opts, {
            desc = "Flutter Emulators",
          }))
          vim.keymap.set("n", "<leader>Fo", "<cmd>FlutterOutlineToggle<cr>", vim.tbl_extend("force", opts, {
            desc = "Flutter Outline",
          }))
          vim.keymap.set("n", "<leader>Ft", "<cmd>FlutterDevTools<cr>", vim.tbl_extend("force", opts, {
            desc = "Flutter DevTools",
          }))
          vim.keymap.set("n", "<leader>FL", "<cmd>FlutterLogClear<cr>", vim.tbl_extend("force", opts, {
            desc = "Flutter Clear Log",
          }))
          vim.keymap.set("n", "<leader>Fp", "<cmd>FlutterPubGet<cr>", vim.tbl_extend("force", opts, {
            desc = "Flutter Pub Get",
          }))

          -- IntelliJ-style shortcuts
          vim.keymap.set("n", "<S-F10>", "<cmd>FlutterRun<cr>", vim.tbl_extend("force", opts, {
            desc = "Flutter Run (Shift+F10)",
          }))
          vim.keymap.set("n", "<C-F5>", "<cmd>FlutterQuit<cr>", vim.tbl_extend("force", opts, {
            desc = "Flutter Quit (Ctrl+F5)",
          }))
        end,
      },
    },
  },

  -- DAP for Flutter/Dart debugging
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = { ensure_installed = { "dart-debug-adapter" } },
      },
    },
    opts = function()
      local dap = require("dap")
      if not dap.adapters.dart then
        dap.adapters.dart = {
          type = "executable",
          command = "dart",
          args = { "debug_adapter" },
        }
      end
      dap.configurations.dart = {
        {
          type = "dart",
          request = "launch",
          name = "Launch Dart",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
      }
    end,
  },

  -- Neotest for Flutter/Dart testing
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "sidlatau/neotest-dart",
    },
    opts = {
      adapters = {
        ["neotest-dart"] = {
          command = "flutter",
          use_lsp = true,
        },
      },
    },
  },

  -- Package version management for pubspec.yaml
  {
    "vuki656/package-info.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    ft = "yaml",
    opts = {
      package_manager = "flutter",
    },
    keys = {
      { "<leader>ps", function() require("package-info").show() end, desc = "Show Package Versions" },
      { "<leader>pu", function() require("package-info").update() end, desc = "Update Package" },
      { "<leader>pd", function() require("package-info").delete() end, desc = "Delete Package" },
      { "<leader>pi", function() require("package-info").install() end, desc = "Install Package" },
    },
  },

  -- Navic for breadcrumbs (integrate with lualine)
  {
    "SmiteshP/nvim-navic",
    lazy = true,
    opts = {
      lsp = {
        auto_attach = true,
      },
      highlight = true,
      separator = " > ",
      depth_limit = 5,
      lazy_update_context = true,
    },
  },

  -- Integrate navic breadcrumbs into lualine
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    opts = function(_, opts)
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
    end,
  },
}
