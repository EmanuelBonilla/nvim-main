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

-- Terminal mode to normal mode
vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
