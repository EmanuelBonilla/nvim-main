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
        lualine_b = { {
          function()
            return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
          end,
          icon = "",
        } },
        lualine_c = { { "filename", path = 1 }, },
        lualine_x = {
          "branch",
          "encoding",
          "fileformat",
          "filetype",
          {
            function()
              return os.date("%H:%M")
            end,
            icon = "",
          },
          function()
            return "󰃰 " .. os.date("%y:%m:%d")
          end,
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      }
    })
  end
}
