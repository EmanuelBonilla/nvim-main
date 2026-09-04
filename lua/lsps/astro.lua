local tsserver_path = vim.fn.system("which tsserver"):gsub("\n", "")
local tsdk = tsserver_path ~= "" and vim.fn.fnamemodify(tsserver_path, ":h:h") .. "/lib/node_modules/typescript/lib" or ""

vim.lsp.config["astro"] = {
  cmd = { "astro-ls", "--stdio" },
  filetypes = { "astro" },
  root_markers = { "astro.config.*", "package.json", ".git" },
  init_options = {
    typescript = {
      tsdk = tsdk,
    },
  },
  settings = {
    astro = {
      checkVersion = true,
    },
  },
}
vim.lsp.enable("astro")
