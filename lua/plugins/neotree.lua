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
        follow_current_file = { enabled = true},
        hijack_netrw_behavior = "open_default",
        renderers = {
          file = {
            { "icon" },
            { "name" },
            { "last_modified", highlight = "Comment" },
          },
        },
      },
      default_component_configs = {
        last_modified = {
          enabled = true,
          format = "%Y-%m-%d %H:%M",
        },
      },
    })

    vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Abrir NeoTree" })
  end,
  lazy = false,
  priority = 1000,
}
