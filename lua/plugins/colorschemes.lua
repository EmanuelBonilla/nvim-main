return {
  {
    "Heorhiy/VisualStudioDark.vim",
    lazy = false,
  },
  {
    "dunstontc/vim-vscode-theme",
    lazy = false,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    config = function()
      local function next_colorscheme()
        local select_colorschemes = { "tokyonight", "tokyonight-moon", "dark_plus", "VisualStudioDark", "retrobox" }
        local current = vim.g.colors_name

        for i, cs in ipairs(select_colorschemes) do
          if cs == current then
            local next = select_colorschemes[i + 1] or select_colorschemes[1]
            vim.cmd.colorscheme(next)
            return
          end
        end
        vim.notify("Current colorscheme: " .. vim.g.colors_name)
      end
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          vim.cmd [[
            highlight Comment gui=italic cterm=italic
            highlight Keyword gui=italic cterm=italic
            highlight Conditional gui=italic cterm=italic
            highlight Type gui=italic cterm=italic
          ]]
        end,
      })
      vim.keymap.set("n", "<leader>uc", next_colorscheme, { desc = "Change colorscheme" })
    end,
  },
}
