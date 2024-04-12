vim.keymap.set({ "n" }, "<c-s-J>", "<cmd>m .+1<cr>==", { desc = "Move down" })
vim.keymap.set({ "n" }, "<c-s-K>", "<cmd>m .-2<cr>==", { desc = "Move up" })
vim.keymap.set({ "i" }, "<c-s-K>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
vim.keymap.set({ "i" }, "<c-s-J>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set({ "v" }, "<c-s-K>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
vim.keymap.set({ "v" }, "<c-s-J>", ":m '>+1<cr>gv=gv", { desc = "Move down" })

vim.keymap.set({ "n" }, "<c-u>", "<c-u>zz")
vim.keymap.set({ "n" }, "<c-d>", "<c-d>zz")
vim.keymap.set({ "n" }, "<c-b>", "<c-b>zz")
vim.keymap.set({ "n" }, "<c-f>", "<c-f>zz")

vim.keymap.set({ "n" }, "<c-a-l>", "<cmd>vertical resize +3<CR>")
vim.keymap.set({ "n" }, "<c-a-h>", "<cmd>vertical resize -3<CR>")
vim.keymap.set({ "n" }, "<c-a-k>", "<cmd>resize +3<CR>")
vim.keymap.set({ "n" }, "<c-a-j>", "<cmd>resize -3<CR>")

vim.keymap.set("n", "<leader>w\\", "<C-W>v", { desc = "Split window right" })
vim.keymap.set("n", "<leader>\\", "<C-W>v", { desc = "Split window right" })

vim.keymap.set("n", "<leader>uR", "<cmd>LspRestart<cr>", { desc = "Restart LSP" })
