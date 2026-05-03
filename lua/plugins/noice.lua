return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      lsp = {
        progress = { enabled = true },
        hover = { enabled = true },
        signature = { enabled = true },
      },
      notify = {
        enabled = true,
      },
      messages = {
        enabled = true,
        view = "notify",
      },
    })
    local notify = require("notify")

    notify.setup({
      stages = "fade",
      timeout = 2000,
      background_colour = "#000000",
      render = "default",
    })
  end,
}
