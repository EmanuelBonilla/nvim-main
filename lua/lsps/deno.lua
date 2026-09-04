require("conform").setup({
  formatters_by_ft = {
    typescript = { "deno_fmt" },
    typescriptreact = { "deno_fmt" },
    javascript = { "deno_fmt" },
    javascriptreact = { "deno_fmt" },
  },
})

vim.lsp.config["denols"] = {
  cmd = { "deno", "lsp" },
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "javascript.jsx" },
  root_markers = { "deno.json", "deno.jsonc", "deps.ts", "mod.ts", ".git" },
  init_options = {
    lint = true,
    suggest = {
      imports = {
        hosts = {
          ["https://deno.land"] = true,
          ["https://cdn.jsdelivr.net"] = true,
          ["https://esm.sh"] = true,
        },
      },
    },
  },
}
vim.lsp.enable("denols")
