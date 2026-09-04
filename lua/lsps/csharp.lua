-- require omnisharp-roslyn
vim.lsp.config["omnisharp"] = {
  cmd = { "OmniSharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
  filetypes = { "cs", "vb" },
  root_markers = {
    function(name, path)
      return name:match("%.sln$") ~= nil or name:match("%.csproj$") ~= nil
    end,
    ".git",
  },
  settings = {
    FormattingOptions = {
      EnableEditorConfigSupport = true,
      OrganizeImports = true,
    },
    RoslynExtensionsOptions = {
      EnableAnalyzersSupport = true,
      EnableImportCompletion = true,
    },
  },
}
vim.lsp.enable("omnisharp")
