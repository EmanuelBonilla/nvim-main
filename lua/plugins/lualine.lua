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
        lualine_a = { { "mode", icon = "" } },
        lualine_b = {
          "branch",
          {
            "diff",
            symbols = { added = " ", modified = " ", removed = " " },
          },
        },
        lualine_c = {
        },
        lualine_x = {
          {
            function()
              return require("nvim-navic").get_location()
            end,
            cond = function()
              return Navic_status == "active" and require("nvim-navic").is_available()
            end,
            color = { fg = "#cba6f7" },
          },
          -- Discord Rich Presence status
          -- {
          --   function()
          --     if Cord_status == "inactive" then
          --       return "󰙯 OFF"
          --     end
          --
          --     if Cord_status == "active" then
          --       return "󰙯 ON"
          --     end
          --
          --     if Cord_status == "idle" then
          --       return "󰙯 IDLE"
          --     end
          --
          --     return "󰙯 IDLE"
          --   end,
          --   color = { fg = "#cba6f7" },
          -- },
        },
        lualine_y = { "progress" },
        lualine_z = {
          "location"
        },
      },
      tabline = {
        lualine_a = { {
          function()
            return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
          end,
          icon = "",
        } },
        lualine_b = {
        },
        lualine_c = {
          { "filename", path = 1, color = { fg = "#888888" } },
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = {
              error = " ",
              warn  = " ",
              info  = " ",
              hint  = "󰌵 ",
            },
          },
        },
        lualine_x = {
        },
        lualine_y = {
          "encoding",
          "fileformat",
          "filetype",
        },
        lualine_z = { {
          function()
            return os.date("%H:%M")
          end,
          icon = "",
        } },
      }
    })
  end
}
