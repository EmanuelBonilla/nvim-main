return {
  'vyfor/cord.nvim',
  event = 'VeryLazy',
  config = function()
    require('cord').setup {
      log_level = nil,
      editor = {
        image = nil,
        client = 'neovim',
        tooltip = 'Teto Coder Sigma',
      },
      idle = {
        enabled = true,
        timeout = 180000, -- 3 minutes
        details = 'idle sybau zZzZzZzZz💤💤',
      }

    }
  end
}
