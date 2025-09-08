-- require nodePackages.vscode-json-languageserver
return {
  require("lspconfig").jsonls.setup({
    cmd = { "vscode-json-languageserver", "--stdio" },
    filetypes = { "json", "jsonc" },
    settings = {
      json = {
        schemas = require("schemastore").json.schemas()
      },
    }
  })
}
