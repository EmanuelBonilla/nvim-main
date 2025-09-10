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

-- Reselect visual block when ident
vim.keymap.set("x", "<", "<gv", { desc = "Indent left and keep selection" })
vim.keymap.set("x", ">", ">gv", { desc = "Indent right and keep selection" })
