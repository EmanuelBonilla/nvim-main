-- require vscode-langservers-extracted typescript-language-server
return {
  require("lspconfig").html.setup({
    capabilities = capabilities
  }),
  require("lspconfig").cssls.setup({
    capabilities = capabilities
  }),
  require("lspconfig").ts_ls.setup({
    capabilities = capabilities,
  })
}
