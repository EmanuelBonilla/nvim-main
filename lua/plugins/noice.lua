return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    local notify = require("notify")
    notify.setup({
      position = "bottom-right",
      top_down = false,
      stages = "fade",
      timeout = 2000,
      background_colour = "#000000",
      render = "default",
    })
    vim.notify = notify

    require("noice").setup({
      lsp = {
        progress = { enabled = true },
        hover = { enabled = true },
        signature = { enabled = true },
      },
      notify = {
        enabled = false,
      },
      messages = {
        enabled = true,
        view = "notify",
      },
    })
  end,
}
