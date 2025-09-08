return {
  "Saghen/blink.cmp",
  dependencies = { "neovim/nvim-lspconfig" },
  lazy = false,
  version = "1.*",
  opts = {
    fuzzy = {
      implementation = "lua"
    },
  },
  config = function()
    local blink = require("blink.cmp")

    blink.setup({
      keymap = {
        preset = "default",
        ["<C-Space>"] = { "show" },
        ["<C-e>"] = { "hide" },
        ["<C-l>"] = { "accept" },
        ["<C-n>"] = { "select_next" },
        ["<C-p>"] = { "select_prev" },
      },
      sources = {
        default = { "lsp", "path", "buffer" }, -- fuentes de sugerencias
      },
    })
  end,
}
