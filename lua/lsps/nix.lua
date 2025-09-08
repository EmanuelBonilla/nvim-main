-- require nil
return {
  require("lspconfig").nil_ls.setup({
  }),
  require("conform").setup({
    formatters_by_ft = {
      nix = { "nixpkgs-fmt" },
    },
  })
}
