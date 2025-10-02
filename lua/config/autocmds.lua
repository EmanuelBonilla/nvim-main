local env_file = "~/.config/nvim/.env"

-- Read .env
for line in io.lines(env_file) do
  local key, value = line:match("^([%w_]+)%s*=%s*(.+)$")
  if key and value then
    vim.env[key] = value
  end
end

local colorscheme = vim.env.COLORSCHEME or "retrobox"
local transparent = vim.env.TRANSPARENT or "true"

vim.cmd.colorscheme(colorscheme)
if transparent == "true" then
  vim.cmd("TransparentEnable")
else
  vim.cmd("TransparentDisable")
end

vim.cmd [[
  highlight Comment gui=italic cterm=italic
  highlight Keyword gui=italic cterm=italic
  highlight Conditional gui=italic cterm=italic
  highlight Type gui=italic cterm=italic
]]
