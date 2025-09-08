-- require rust-analyzer
return {
  require("lspconfig").rust_analyzer.setup({
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
        },
      }
    },
  })
}
