return {
  "ibhagwan/fzf-lua",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local fzf = require("fzf-lua")

    fzf.register_ui_select()

    fzf.setup({
      winopts = {
        height = 0.85,
        width = 0.80,
        row = 0.35,
        col = 0.50,
        border = "rounded",
      },
      files = {
        cmd = "fd --type f --hidden --follow --exclude .git",
      },
    })

    vim.keymap.set("n", "<leader><leader>", fzf.files, { desc = "Buscar archivos (atajo alterno)" })
    vim.keymap.set("n", "<leader>.", fzf.live_grep, { desc = "Buscar en contenido (atajo alterno)" })
    vim.keymap.set("n", "<leader>,", fzf.buffers, { desc = "Buscar buffers (atajo alterno)" })
    vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "Buscar ayuda" })
    vim.keymap.set("n", "<leader>o", function()
      fzf.oldfiles({ cwd_only = true })
    end, { desc = "Recent files" })
  end,
}
