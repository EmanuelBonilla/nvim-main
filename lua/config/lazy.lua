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
local dirs = { "plugins" }

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

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    local lsppath = basepath .. "lsps"
    for _, file in ipairs(vim.fn.glob(lsppath .. "/*.lua", false, true)) do
      dofile(file)
    end
  end,
})

-- Sanitize LSP edits to prevent annotationId from causing issues with formatting tools like Conform or Rename.
local orig_apply = vim.lsp.util.apply_text_edits
vim.lsp.util.apply_text_edits = function(edits, bufnr, offset_encoding)
  local sanitized = vim.tbl_map(function(edit)
    local e = vim.deepcopy(edit)
    e.annotationId = nil
    return e
  end, edits)
  return orig_apply(sanitized, bufnr, offset_encoding)
end
