-- Require jdtls
return {
  require("lspconfig").jdtls.setup({
    cmd = { "jdtls" },
    capabilities = capabilities,
    root_dir = require("lspconfig").util.root_pattern(".git", "mvnw", "gradlew", "pom.xml", "build.gradle"),
    settings = {
      java = {
        signatureHelp = { enabled = true },
      },
    }
  })
}
