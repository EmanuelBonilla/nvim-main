vim.lsp.config["terraformls"] = {
  cmd = { "terraform-ls", "serve" },
  filetypes = { "terraform", "terraform-vars", "hcl" },
}

vim.lsp.enable("terraformls")
