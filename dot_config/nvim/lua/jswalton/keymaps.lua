vim.g.mapleader = " "
vim.opt.termguicolors = true

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.api.nvim_set_keymap(
  "n",
  "<space>fb",
  ":Telescope file_browser",
  { noremap = true }
)

vim.keymap.set("n", "<Leader>j", "<C-w><C-j>", { desc = "Move cursor bottom window" })
vim.keymap.set("n", "<Leader>k", "<C-w><C-k>", { desc = "Move cursor top window" })
vim.keymap.set("n", "<Leader>l", "<C-w><C-l>", { desc = "Move cursor left window" })
vim.keymap.set("n", "<Leader>h", "<C-w><C-h>", { desc = "Move cursor right window" })
vim.keymap.set("n", "<Tab>", "<Cmd>bnext<CR>", { desc = "Go to next buffer" })
vim.keymap.set("n", "<S-Tab>", "<Cmd>bprevious<CR>", { desc = "Go to previous buffer" })

vim.keymap.set("n", "<Leader>tt", "<Cmd>Neotree reveal toggle<CR>", { desc = "Toggle file tree" })
vim.keymap.set("n", "<Leader>tc", "<Cmd>Neotree action=close source=filesystem<CR>", { desc = "Close file tree" })
vim.keymap.set("n", "<Leader>tf", "<Cmd>Neotree reveal action=focus<CR>", { desc = "Focus file tree" })