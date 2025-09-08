return {
  "kdheepak/lazygit.nvim",
  lazy = false,
  config = function()
    vim.api.nvim_set_keymap(
      "n",
      "<leader>g",
      ":LazyGit<CR>",
      { noremap = true, silent = true }
    )
  end
}
