-- require nodePackages.vscode-json-languageserver
vim.lsp.config["jsonls"] = {
  cmd = { "vscode-json-languageserver", "--stdio" },
  filetypes = { "json", "jsonc" },
  root_markers = { ".git" },
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
    },
  },
}
vim.lsp.enable("jsonls")
