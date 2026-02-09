return {
  'vyfor/cord.nvim',
  event = 'VeryLazy',
  config = function()
    require('cord').setup {
      log_level = nil,
      editor = {
        image = nil,
        client = 'neovim',
        tooltip = 'Trash Code',
      },
      idle = {
        enabled = true,
        timeout = 180000, -- 3 minutes
        details = 'idle sybau zZzZzZzZz💤💤',
      },
      text = {
        workspace = function(opts)
          return "idk 🐢"
        end,
        file_browser = "ls -la",
        editing = function(opts)
          local fullpath = vim.api.nvim_buf_get_name(0)
          local dir = vim.fn.fnamemodify(fullpath, ":h:t")
          return "farming on " .. dir .. "/" .. opts.filename
        end
      }
    }
  end
}
