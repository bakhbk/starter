-- AI Chat with Ollama integration
return {
  -- Gen.nvim - simple Ollama interface for quick prompts
  {
    "David-Kunz/gen.nvim",
    cmd = "Gen",
    opts = {
      model = "codellama", -- default model (can be changed)
      host = "localhost",
      port = "11434",
      quit_map = "q",
      retry_map = "<c-r>",
      init = function(options)
        pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
      end,
      command = function(options)
        local body = {
          model = options.model,
          stream = true,
        }
        return "curl --silent --no-buffer -X POST http://"
          .. options.host
          .. ":"
          .. options.port
          .. "/api/chat -d $body"
      end,
      display_mode = "float", -- float, split, horizontal-split
      show_prompt = false,
      show_model = true,
      no_auto_close = false,
      debug = false,
    },
    keys = {
      { "<leader>ai", "<cmd>Gen<cr>", mode = { "n", "v" }, desc = "Ollama Chat" },
      { "<leader>ac", "<cmd>Gen Chat<cr>", mode = { "n", "v" }, desc = "Ollama Chat (window)" },
      { "<leader>ag", "<cmd>Gen Generate<cr>", mode = "v", desc = "Generate Code" },
      { "<leader>ae", "<cmd>Gen Enhance_Code<cr>", mode = "v", desc = "Enhance Code" },
      { "<leader>ar", "<cmd>Gen Review_Code<cr>", mode = "v", desc = "Review Code" },
      { "<leader>ax", "<cmd>Gen Enhance_Grammar_Spelling<cr>", mode = "v", desc = "Fix Grammar" },
    },
  },

  -- CodeCompanion with Ollama support
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      strategies = {
        chat = {
          adapter = "ollama",
        },
        inline = {
          adapter = "ollama",
        },
      },
      adapters = {
        ollama = function()
          return require("codecompanion.adapters").extend("ollama", {
            schema = {
              model = {
                default = "codellama:latest",
              },
              num_ctx = {
                default = 16384,
              },
              num_predict = {
                default = -1,
              },
            },
          })
        end,
      },
    },
    keys = {
      { "<leader>aa", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "CodeCompanion Actions" },
      { "<leader>at", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "Toggle Chat" },
      { "<leader>ao", "<cmd>CodeCompanionChat<cr>", mode = { "n", "v" }, desc = "Open Chat" },
      { "ga", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "Add to Chat" },
    },
  },

  -- which-key entries moved to lua/plugins/which-key.lua
}
