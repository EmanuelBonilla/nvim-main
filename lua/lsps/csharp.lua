-- require roslyn-ls
vim.lsp.config["roslyn_ls"] = {
  cmd = {
    "Microsoft.CodeAnalysis.LanguageServer",
    "--logLevel",
    "Information",
    "--extensionLogDirectory",
    vim.fs.joinpath(vim.uv.os_tmpdir(), "roslyn_ls/logs"),
    "--stdio",
  },
  filetypes = { "cs", "razor", "cshtml", "vb" },
  root_markers = {
    function(name, path)
      return name:match("%.sln$") ~= nil or name:match("%.csproj$") ~= nil
    end,
    ".git",
  },
  settings = {
    ["csharp|formatting"] = {
      dotnet_organize_imports_on_format = true,
    },
    ["csharp|completion"] = {
      dotnet_show_completion_items_from_unimported_namespaces = true,
    },
    ["csharp|background_analysis"] = {
      dotnet_analyzer_diagnostics_scope = "fullSolution",
      dotnet_compiler_diagnostics_scope = "fullSolution",
    },
  },
}
vim.lsp.enable("roslyn_ls")
