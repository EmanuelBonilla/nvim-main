-- require nil
require("conform").setup({
  formatters_by_ft = { nix = { "nixpkgs-fmt" } },
})

vim.lsp.config["nil_ls"] = {
  cmd = { "nil" },
  filetypes = { "nix" },
  root_markers = { "flake.nix", ".git" },
}
vim.lsp.enable("nil_ls")
