-- require omnisharp-roslyn
vim.lsp.config["omnisharp"] = {
  cmd = { "OmniSharp" },
  filetypes = { "cs", "vb" },
  root_markers = { "*.sln", "*.csproj", ".git" },
  settings = {
    omnisharp = {
      enableRoslynAnalyzers = true,
      organizeImportsOnFormat = true,
      enableImportCompletion = true,
    },
  },
}
vim.lsp.enable("omnisharp")
