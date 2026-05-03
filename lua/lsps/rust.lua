-- require rust-analyzer
vim.lsp.config["rust_analyzer"] = {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = { "Cargo.toml", ".git" },
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
    },
  },
}
vim.lsp.enable("rust_analyzer")
