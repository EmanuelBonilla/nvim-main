-- require vscode-langservers-extracted typescript-language-server
vim.lsp.config["html"] = {
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html" },
  root_markers = { "package.json", ".git" },
}
vim.lsp.enable("html")

vim.lsp.config["cssls"] = {
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less" },
  root_markers = { "package.json", ".git" },
}
vim.lsp.enable("cssls")

vim.lsp.config["ts_ls"] = {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  root_markers = { "tsconfig.json", "package.json", ".git" },
}
vim.lsp.enable("ts_ls")
