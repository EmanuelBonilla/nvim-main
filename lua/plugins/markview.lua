return {
  'MeanderingProgrammer/render-markdown.nvim',
  lazy = false,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons'
  },
  config = function()
    require('render-markdown').setup({
      enabled = true,
      latex = {
        enabled = true,
        converter = 'latex2text',
        highlight = 'RenderMarkdownMath',
        top_pad = 0,
        bottom_pad = 0,
      },
      heading = {
        enabled = true,
        sign = true,
        icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
      },
      code = {
        enabled = true,
        sign = true,
        style = 'full',
      },
      conceal = {
        enabled = true,
        hide_markers = true,
      }
    })
    vim.keymap.set('n', '<leader>mr', ':RenderMarkdown toggle<CR>', 
      { desc = 'Toggle Markdown Render', silent = true })
    vim.opt.conceallevel = 2
  end,
}
