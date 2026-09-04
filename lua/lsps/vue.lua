vim.lsp.config["volar"] = {
  cmd = { "vue-language-server", "--stdio" },
  filetypes = { "vue" },
  root_markers = { "vue.config.*", "package.json", ".git" },
  init_options = {
    vue = {
      html = {
        hybridMode = true,
      },
    },
  },
}
vim.lsp.enable("volar")
