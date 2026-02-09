return {
  'vyfor/cord.nvim',
  event = 'VeryLazy',
  config = function()
    require('cord').setup {
      log_level = nil,
      editor = {
        icon = 'https://juststickers.in/wp-content/uploads/2015/07/vim-editor.png',
        client = 'vim',
        tooltip = 'Trash Code',
      },
      idle = {
        enabled = true,
        timeout = 180000, -- 3 minutes
        details = 'idle sybau zZzZzZzZz💤💤',
        icon = 'https://i.pinimg.com/736x/52/69/ac/5269ac9bace7e238faef1ba49f3a4365.jpg',
      },
      assets = {
        ['Cord.override'] = 'https://i.pinimg.com/736x/e5/ab/3f/e5ab3f983338294e2a5816a1508b5ddf.jpg',
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
      },
      hooks = {
        ready = function(m)
          Cord_status = "active"
        end,
        shutdown = function()
          Cord_status = "inactive"
        end,
        idle_enter = function(opts)
          Cord_status = "idle"
        end,
        idle_leave = function(opts)
          Cord_status = "active"
        end,
      }
    }
  end
}
