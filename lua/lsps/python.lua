return {
  require("conform").setup({formatters_by_ft = {python = { "blue" }}}),
  require("lspconfig").basedpyright.setup({
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
          },
        },
      },
    },
  })
}
