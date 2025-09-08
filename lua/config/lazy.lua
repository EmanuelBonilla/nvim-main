-- Bootstrapping Lazy.nvim and configuring
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

local basepath = vim.fn.stdpath("config") .. "/lua/"
local dirs = { "plugins", "lsps" }

for _, dir in ipairs(dirs) do
  vim.fn.mkdir(basepath .. dir, "p")
end

require("lazy").setup({
  spec = vim.tbl_map(function(dir)
    return { import = dir }
  end, dirs),
  ui = { border = "rounded" },
  defaults = {
    lazy = true,
    version = false,
  },
  install = { colorscheme = { "habamax", "tokyonight" } },
  checker = {
    enabled = true,
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})



