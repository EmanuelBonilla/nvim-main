return { 
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  priority = 1000,
  config = function()
    require("lualine").setup({
      options = { 
        theme = "auto",
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { "filename" },
        lualine_x = {
          "encoding",
          "fileformat",
          "filetype",
          {
            function ()
              return os.date("%H:%M")
            end,
            icon = "",
          }
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      }
    })
  end
}
