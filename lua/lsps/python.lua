require("conform").setup({ formatters_by_ft = { python = { "blue" } } })

vim.lsp.config["basedpyright"] = {
  cmd = { "basedpyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "setup.py", ".git" },
  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = "strict",
        diagnosticsMode = "workspace",
        include = "./*.py",
        diagnosticSeverityOverrides = {
          reportUnannotatedClassAttribute = "information",
          reportAny = "warning",
          reportExplicitAny = "warning",
          reportUnusedCallResult = "information",
          reportIncompatibleUnannotatedOverride = "warning",
          reportImplicitOverride = "warning",
          reportIncompatibleVariableOverride = "warning",
          reportUnusedParameter = "warning",
          reportUnusedImport = "warning",
          reportUnknownVariableType = "warning",
          reportUnusedVariable = "warning",
          reportMissingParameterType = "warning",
          reportUnknownParameterType = "warning",
          reportUnknownMemberType = "warning",
          reportUnknownLambdaType = "warning",
          reportUnknownArgumentType = "warning",
          reportPrivateUsage = "warning",
        },
      },
    },
  },
}

vim.lsp.config["pyrefly"] = {
  cmd = { "pyrefly", "lsp" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "pyrefly.toml", "setup.py", ".git", "manage.py" },
  -- NOTE PYREFLY REQUIRES CONFIGURATION.TOML IN THE PROJECT ROOT, OTHERWISE IT WILL NOT WORKS
  -- HOW PROGRAMER WISHES
  settings = {
    python = {
      pyrefly = {
        typeCheckingMode = "strict",
        displayTypeErrors = "force-on",
        preset = "strict",
        analysis = {
          diagnosticsMode = "workspace",
        }
      },
    },
  },
}
vim.lsp.enable("pyrefly")
