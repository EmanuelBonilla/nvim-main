require("conform").setup({
  formatters_by_ft = {
    php = { "pint" },
  },
})

vim.lsp.config["phpactor"] = {
  cmd = { "phpactor", "language-server" },
  filetypes = { "php" },
  root_markers = { "composer.json", ".git" },
}
vim.lsp.enable("phpactor")
