require("toggleterm").setup({
  size = 15, -- Высота терминала (измените по желанию)
  open_mapping = [[<C-\>]], -- Горячая клавиша для открытия/закрытия
  shade_terminals = true, -- Затемнение при переключении окон
  direction = "horizontal", -- Терминал открывается внизу
  persist_size = true, -- Запоминает размер при закрытии
  start_in_insert = true, -- Сразу переходит в insert-режим
})

return {}
