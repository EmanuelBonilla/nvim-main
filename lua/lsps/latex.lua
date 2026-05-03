-- require texlab
vim.lsp.config["texlab"] = {
  cmd = { "texlab" },
  filetypes = { "tex", "bib" },
  root_markers = { ".git" },
  settings = {
    texlab = {
      build = {
        executable = "latexmk",
        args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
        onSave = true,
      },
      forwardSearch = {
        executable = "zathura",
        args = { "--synctex-forward", "%l:1:%f", "%p" },
      },
      auxDirectory = "build",
      lint = { onEdit = true, onSave = true },
    },
  },
}
vim.lsp.enable("texlab")
