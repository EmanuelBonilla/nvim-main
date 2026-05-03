-- require taplo (TOML language server)
vim.lsp.config["taplo"] = {
  cmd = { "taplo", "lsp", "stdio" },
  filetypes = { "toml" },
  root_markers = { ".git" },
}
vim.lsp.enable("taplo")
