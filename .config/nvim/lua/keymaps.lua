local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set("n", "<leader>fs", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fi', builtin.treesitter, {})
vim.keymap.set('n', '<leader>fg', builtin.lsp_dynamic_workspace_symbols, {})

--- telescope lsp
vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, {})
vim.keymap.set('n', '<leader>gr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>gc', builtin.lsp_incoming_calls, {})
vim.keymap.set('n', '<leader>gi', builtin.lsp_implementations, {})
vim.keymap.set('n', '<leader>gx', builtin.diagnostics, {})

--- neovim-tree
vim.keymap.set('n', '<c-c>', "<cmd>NvimTreeToggle<cr>")
