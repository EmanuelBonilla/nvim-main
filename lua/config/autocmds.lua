local env_file = vim.fn.expand("~/.config/nvim/.env")

-- Read .env
for line in io.lines(env_file) do
  local key, value = line:match("^([%w_]+)%s*=%s*(.+)$")
  if key and value then
    vim.env[key] = value
  end
end

local colorscheme = vim.env.COLORSCHEME or "retrobox"
local transparent = vim.env.TRANSPARENT or "true"
Cord_status = "inactive"
Navic_status = vim.env.NAVIC_STATUS or "inactive"

if Navic_status ~= "inactive" then
  Navic_status = "active"
end


local function fix_floats()
  -- Quita el “cuadro negro” de ventanas flotantes (hover, help, etc.)
  -- bg = "NONE" hace que use tu fondo/transparencia
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })

  -- Opcional: color del borde (si lo quieres visible)
  -- vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#6c7086", bg = "NONE" })
end

-- re-aplica cuando se setea el colorscheme
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    fix_floats()
  end,
})

vim.cmd.colorscheme(colorscheme)
if transparent == "true" then
  vim.cmd("TransparentEnable")
else
  vim.cmd("TransparentDisable")
end


fix_floats()

vim.cmd [[
  highlight Comment gui=italic cterm=italic
  highlight Keyword gui=italic cterm=italic
  highlight Conditional gui=italic cterm=italic
  highlight Type gui=italic cterm=italic
]]
