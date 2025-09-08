-- require yaml-language-server
return {
  require('lspconfig').yamlls.setup {
    settings = {
      yaml = {
        schemas = {
          ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*"
        },
      },
    },
  }
}
