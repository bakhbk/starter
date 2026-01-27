return {
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
    init = function()
      local on_attach

      local ok_snacks, snacks_lsp = pcall(require, "snacks.util.lsp")
      if ok_snacks and type(snacks_lsp.on) == "function" then
        on_attach = snacks_lsp.on
      else
        local ok_lazy, lazy_util = pcall(require, "lazyvim.util")
        if ok_lazy and lazy_util.lsp then
          if type(lazy_util.lsp.on) == "function" then
            on_attach = lazy_util.lsp.on
          elseif type(lazy_util.lsp.on_attach) == "function" then
            on_attach = lazy_util.lsp.on_attach
          end
        end
      end

      if not on_attach then
        return
      end

      on_attach(function(a, b)
        local client, bufnr
        if type(a) == "number" then
          bufnr = a
          client = b
        else
          client = a
          bufnr = b
        end

        if not client or not bufnr then
          return
        end

        if client.server_capabilities and client.server_capabilities.documentSymbolProvider then
          local ok, navic = pcall(require, "nvim-navic")
          if ok and navic.attach then
            navic.attach(client, bufnr)
          end
        end
      end)
    end,
  },
}
