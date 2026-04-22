-- require taplo (TOML language server)
return {
  require("lspconfig").taplo.setup({
    cmd = { "taplo", "lsp", "stdio" },
    filetypes = { "toml" },
    single_file_support = true,
  }),
}
