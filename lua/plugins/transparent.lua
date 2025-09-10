return {
  "https://github.com/xiyaowong/transparent.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.keymap.set("n", "<leader>ut", ":TransparentToggle<CR>", { desc = "Toggle transparency" })
  end
}
