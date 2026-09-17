-- keymaps for navingating between split windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- LSP keymappings
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

-- Diagnostics
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)

-- Telescope
vim.keymap.set("n", "<leader><leader>", "<cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<leader>f", "<cmd>Telescope live_grep<CR>")

-- split windows
vim.keymap.set("n", "<leader>|", "<cmd>vsplit<CR>")
vim.keymap.set("n", "<leader>-", "<cmd>split<CR>")

-- buffer management
vim.keymap.set("n", "<S-l>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<S-h>", "<cmd>bprev<CR>")
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>")
