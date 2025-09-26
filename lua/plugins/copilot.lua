return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    lazy = false,
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<C-l>",
            next = "<C-]>",
            prev = "<C-[",
            dismiss = "<C-c>",
          }
        },
        panel = { enabled = true },
      })
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    lazy = false,
    dependencies = { "zbirenbaum/copilot.lua" },
    opts = {},
    config = function()
      require("CopilotChat").setup({
        window = {
          layout = "float",
          width = 100,
          height = 0.8,
          border = "rounded",
          row = 2,
        }
      })
      vim.keymap.set("n", "<leader>c", function()
        require("CopilotChat").toggle()
      end, { desc = "Abrir Copilot Chat" })
    end,
  }
}
