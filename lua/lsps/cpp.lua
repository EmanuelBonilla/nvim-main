-- require clang-tools
vim.lsp.config["clangd"] = {
  cmd = { "clangd", "--background-index" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_markers = { "compile_commands.json", "CMakeLists.txt", ".git" },
}
vim.lsp.enable("clangd")
