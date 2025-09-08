-- Leader, Save and Quit
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'i' }, '<C-s>', ':w<CR>', { desc = "Save File", noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", ":qa<CR>", { desc = "Close Nvim" })
-- Windows
vim.keymap.set("n", "<leader>w", "<C-w>", { desc = "Use windows commands" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Ir a la ventana izquierda" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Ir a la ventana derecha" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Ir a la ventana abajo" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Ir a la ventana arriba" })

-- Buffers
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { desc = "Close Current Buffer" })

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
