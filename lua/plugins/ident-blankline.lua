return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  config = function()
    local hooks = require("ibl.hooks")
    
    -- 🔹 Configurar colores para mejor visibilidad
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "IblIndent", { fg = "#3C4048" })
      vim.api.nvim_set_hl(0, "IblScope", { fg = "#E06C75", bold = true })
    end)

    require("ibl").setup({
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = {
        enabled = true,
        show_start = true,
        show_end = true,
        char = "┃",
        -- 🔹 Configuración manual para diferentes lenguajes
        include = {
          node_type = {
            lua = {
              "return_statement",
              "table_constructor",
              "function_definition",
              "if_statement",
              "for_statement",
              "while_statement",
              "repeat_statement",
              "do_statement",
            },
            python = {
              "function_definition",
              "class_definition",
              "if_statement",
              "for_statement",
              "while_statement",
              "with_statement",
              "try_statement",
            },
            javascript = {
              "statement_block",
              "function_declaration",
              "arrow_function",
              "if_statement",
              "for_statement",
              "while_statement",
              "switch_statement",
            },
            typescript = {
              "statement_block",
              "function_declaration",
              "arrow_function",
              "if_statement",
              "for_statement",
              "while_statement",
              "switch_statement",
            },
            rust = {
              "block",
              "function_item",
              "if_expression",
              "while_expression",
              "for_expression",
              "loop_expression",
              "match_expression",
            },
          }
        },
      },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    })
  end,
}
