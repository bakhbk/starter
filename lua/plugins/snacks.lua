return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- 1. Проводник (Explorer) - делаем его основным инструментом
    picker = {
      sources = {
        explorer = {
          hidden = true,      -- Показывать скрытые файлы по умолчанию
          ignored = true,     -- Показывать gitignore файлы (удобно для node_modules или конфигов)
          layout = { 
            layout = { position = "left" } -- Всегда слева, как классический Neotree
          },
          -- Настраиваем поведение клавиш в проводнике
          win = {
            list = {
              keys = {
                ["<BS>"] = "explorer_up", -- Backspace для перехода на уровень вверх
                ["l"] = "confirm",         -- l для открытия папки/файла (как в nnn/ranger)
                ["h"] = "explorer_up",     -- h для закрытия папки
              },
            },
          },
        },
      },
      -- 2. Глобальные настройки Picker (улучшаем поиск)
      ui_select = true, -- Заменяет стандартный vim.ui.select (красивые меню выбора)
      win = {
        input = {
          keys = {
            -- Быстрое перемещение по результатам поиска через Ctrl+j/k
            ["<C-j>"] = { "list_down", mode = { "i", "n" } },
            ["<C-k>"] = { "list_up", mode = { "i", "n" } },
          },
        },
      },
    },
    -- 3. Красивые уведомления (Notifier)
    notifier = {
      enabled = true,
      timeout = 3000, -- 3 секунды
    },
    -- 4. Всплывающее окно терминала
    terminal = {
      win = { style = "terminal", border = "rounded" },
    },
    -- 5. Индикаторы Git (Statuscolumn) - как в VS Code
    statuscolumn = { enabled = true },
    -- 6. Анимации прокрутки (Scroll) - если хотите плавности
    scroll = { enabled = true },
  },
  keys = {
    -- Продвинутые маппинги для быстрого доступа
    { "<leader>e", function() Snacks.picker.explorer() end, desc = "Explorer" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
    { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep (Search in files)" },
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
    { "<leader>un", function() Snacks.notifier.show_history() end, desc = "Notification History" },
    { "<c-t>",      function() Snacks.terminal() end, desc = "Terminal", mode = {"n", "t"} },
  },
}
