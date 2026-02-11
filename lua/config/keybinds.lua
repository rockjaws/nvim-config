local opts = { noremap = true, silent = true }
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
vim.keymap.set({ "n", "i", "v" }, "<Up>", "<Nop>", opts)
vim.keymap.set({ "n", "i", "v" }, "<Down>", "<Nop>", opts)
vim.keymap.set({ "n", "i", "v" }, "<Left>", "<Nop>", opts)
vim.keymap.set({ "n", "i", "v" }, "<Right>", "<Nop>", opts)

