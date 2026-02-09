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
        lualine_a = { {
          function()
            return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
          end,
          icon = "",
        } },
        lualine_b = {},
        lualine_c = {
          { "filename", path = 1 },
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = {
              error = " ",
              warn  = " ",
              info  = " ",
              hint  = "󰌵 ",
            },
          }
        },
        lualine_x = {
          -- {
          --   function()
          --     local msg = "No LSP"
          --     local buf_ft = vim.bo.filetype
          --     local clients = vim.lsp.get_active_clients()
          --     for _, client in ipairs(clients) do
          --       if client.config.filetypes and vim.tbl_contains(client.config.filetypes, buf_ft) then
          --         return " " .. client.name
          --       end
          --     end
          --     return msg
          --   end,
          -- },
          {
            function()
              if Cord_status == "inactive" then
                return "󰙯 OFF"
              end

              if Cord_status == "active" then
                return "󰙯 ON"
              end

              if Cord_status == "idle" then
                return "󰙯 IDLE"
              end

              return "󰙯 IDLE"
            end,
            color = { fg = "#cba6f7" },
          }
        },
        lualine_y = {
        },
        lualine_z = {
          {
            function()
              return os.date("%H:%M")
            end,
            icon = "",
          },
          -- function()
          --   return "󰃰 " .. os.date("%y:%m:%d")
          -- end,
          -- {
          --   function()
          --     local current = vim.fn.line(".")
          --     local total = vim.fn.line("$")
          --     local chars = { "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" }
          --     local idx = math.ceil(current / total * #chars)
          --     return chars[idx]
          --   end,
          -- }
        },
      },
      tabline = {
        lualine_a = { { "mode", icon = "" } },
        lualine_b = {
          "branch",
          {
            "diff",
            symbols = { added = " ", modified = " ", removed = " " },
          },
        },
        lualine_x = {
          "encoding",
          "fileformat",
          "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      }
    })
  end
}
