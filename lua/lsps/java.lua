-- Require jdtls
vim.lsp.config["jdtls"] = {
  cmd = { "jdtls" },
  filetypes = { "java" },
  root_markers = { "pom.xml", "build.gradle", "mvnw", "gradlew", ".git" },
  settings = {
    java = {
      signatureHelp = { enabled = true },
    },
  },
}
vim.lsp.enable("jdtls")
