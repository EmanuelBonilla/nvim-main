return {
  "neovim/nvim-lspconfig",
  config = function()
    local fzf = require('fzf-lua')
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Shows the Definition of a class variable etc" })
    vim.keymap.set("n", "gd", fzf.lsp_definitions, { desc = "Go to definitions of a class variable etc" })
    vim.keymap.set("n", "gr", fzf.lsp_references, { desc = "Go to references of a class variable etc" })
    vim.keymap.set("n", "H", vim.diagnostic.open_float, { desc = "Show diagnostics in a new float window" })
    vim.keymap.set("n", "<leader>s", fzf.lsp_document_symbols, { desc = "Document symbols (fzf)" })
    vim.keymap.set("n", "<leader>S", fzf.lsp_workspace_symbols, { desc = "Workspace symbols (fzf)" })
    vim.keymap.set("n", "<leader>d", ":FzfLua diagnostics_document <CR>", { desc = "Document diagnostics (fzf)" })
    vim.keymap.set("n", "<leader>D", ":FzfLua diagnostics_workspace <CR>", { desc = "Workspace diagnostics (fzf)" })
    vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename all references of a class variable etc" })
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename all references of a class variable etc" })

    local conform = require("conform")
    vim.keymap.set({ "n", "v" }, "<leader>f", function()
      conform.format({ async = true, lsp_fallback = true })
    end, { desc = "Format buffer" })
    vim.keymap.set({ "n", "i", "v" }, "<C-f>", function()
      conform.format({ async = true, lsp_fallback = true })
    end, { desc = "Format buffer" })

    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN]  = "",
          [vim.diagnostic.severity.INFO]  = "",
          [vim.diagnostic.severity.HINT]  = "",

        },
      },
    })
  end,
}
