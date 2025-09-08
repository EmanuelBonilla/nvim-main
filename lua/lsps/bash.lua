-- require bash-language-server
return {
  require("lspconfig").bashls.setup({
    cmd = { "bash-language-server", "start" },
    filetypes = { "sh", "bash" },
    single_file_support = true,
  })
}
