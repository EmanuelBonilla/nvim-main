return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        follow_current_file = true, -- sigue el archivo activo
        hijack_netrw_behavior = "open_default", -- reemplaza netrw
      },
    })
    -- Keymap para abrir/cerrar
    vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Abrir NeoTree" })
  end,
  lazy = false,
  priority = 1000
}
