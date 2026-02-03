-- Leader, Save and Quit
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'i' }, '<C-s>', ':w<CR>', { desc = "Save File", noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", ":qa<CR>", { desc = "Close Nvim" })

-- Windows
vim.keymap.set("n", "<leader>w", "<C-w>", { desc = "Use windows commands" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to down window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to up window" })

-- Buffers
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { desc = "Close Current Buffer" })
vim.keymap.set("n", "<leader>bD", ":bwipeout<CR>", { desc = "Close Current Buffer True" })
vim.keymap.set("n", "<leader>bn", ":echo expand('%:p')<CR>", { desc = "Get name of buffer" })

-- Terminal mode to normal mode, except for lazygit
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function(args)
    local buf = args.buf
    local chan = vim.b[buf].terminal_job_id
    local cmd = vim.api.nvim_buf_get_name(buf)
    if not cmd:match("lazygit") then
      vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { buffer = buf, noremap = true, silent = true })
    end
  end,
})

vim.keymap.set("x", "<", "<gv", { desc = "Indent left and keep selection" })
vim.keymap.set("x", ">", ">gv", { desc = "Indent right and keep selection" })

vim.api.nvim_create_user_command('Mk', function(opts)
  local cwd = vim.fn.getcwd()
  local path = cwd .. '/' .. opts.args
  if string.sub(opts.args, -1) == '/' then
    vim.fn.system({'mkdir', '-p', path})
    print('Created: ' .. path)
  else
    vim.fn.system({'mkdir', '-p', vim.fn.fnamemodify(path, ':h')})
    vim.fn.system({'touch', path})
    vim.cmd('edit ' .. vim.fn.fnameescape(path))
    print('Created: ' .. path)
  end
end, { nargs = 1, complete = 'file' })

vim.api.nvim_create_user_command('MkAbs', function(opts)
  local path = opts.args
  if string.sub(opts.args, -1) == '/' then
    vim.fn.system({'mkdir', '-p', path})
    print('Created: ' .. path)
  else
    vim.fn.system({'mkdir', '-p', vim.fn.fnamemodify(path, ':h')})
    vim.fn.system({'touch', path})
    vim.cmd('edit ' .. vim.fn.fnameescape(path))
    print('Created: ' .. path)
  end
end, { nargs = 1 })

vim.keymap.set("n", "<leader>T", function()
  local buf_path = vim.api.nvim_buf_get_name(0)
  local dir = vim.fn.fnamemodify(buf_path, ":p:h")
  local pwd = vim.fn.getcwd()
  local buf_and_path_and_pwd = buf_path .. "\n" .. dir .. "\n" .. pwd
  vim.print(buf_and_path_and_pwd)
end, { desc = "Test" })

vim.keymap.set("n", "<leader>n", function()
  local buf_path = vim.api.nvim_buf_get_name(0)
  local dir = vim.fn.fnamemodify(buf_path, ":p:h")
  vim.ui.input({ prompt = "Mk (relative to buffer): " }, function(input)
    if input and #input > 0 then
      local abs_path = dir .. "/" .. input
      vim.cmd("MkAbs " .. vim.fn.fnameescape(abs_path))
    end
  end)
end, { desc = "Mk relative to buffer" })

vim.keymap.set("n", "<leader>N", function()
  vim.ui.input({ prompt = "Mk (cwd): " }, function(input)
    if input and #input > 0 then
      vim.cmd("Mk " .. vim.fn.fnameescape(input))
    end
  end)
end, { desc = "Mk relative to cwd" })
