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
        ["<CR>"] = { "select_and_accept", "fallback_to_mappings" },
        ["<C-n>"] = { "select_next" },
        ["<C-p>"] = { "select_prev" },
        ["<C-k>"] = { "show_documentation", "show_signature" },
      },
      sources = {
        default = { "lsp", "path", "buffer" },
      },
    })
  end,
}
