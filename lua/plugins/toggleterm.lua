return {
  "akinsho/toggleterm.nvim",
  version = "*",
  lazy = false,
  config = function()
    require("toggleterm").setup{
      size = 60,
      hide_numbers = true,
      shade_terminals = true,
      start_in_insert = true,
      direction = "float",
      float_opts = {
        border = "curved",
        width = math.floor(vim.o.columns * 0.9),
        height = math.floor(vim.o.lines * 0.9),
        winblend = 0,
      },
    }

    local Terminal  = require('toggleterm.terminal').Terminal
    local float_term = Terminal:new({ direction = "float" })

    vim.keymap.set({ "n", "t" }, "<C-_>", function()
      float_term:toggle()
    end, { noremap = true, silent = true })
  end
}
