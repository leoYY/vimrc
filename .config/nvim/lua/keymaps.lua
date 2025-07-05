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
vim.keymap.set('n', '<leader>fr', builtin.registers, {})
vim.keymap.set('n', '<leader>ft', builtin.treesitter, {})

vim.keymap.set('n', '<leader>fj', builtin.jumplist, {})
vim.keymap.set('n', '<leader>fc', builtin.command_history, {})
--- telescope lsp
vim.keymap.set('n', '<leader>gt', builtin.lsp_type_definitions, {})
vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, {})
vim.keymap.set('n', '<leader>gr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>gc', builtin.lsp_incoming_calls, {})
vim.keymap.set('n', '<leader>go', builtin.lsp_outgoing_calls, {})
vim.keymap.set('n', '<leader>gi', builtin.lsp_implementations, {})
vim.keymap.set('n', '<leader>gx', builtin.diagnostics, {})

--- telescope git 
vim.keymap.set('n', '<leader>lc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>lb', builtin.git_bcommits, {})
vim.keymap.set('n', '<leader>ls', builtin.git_status, {})

--- neovim-tree
vim.keymap.set('n', '<c-c>', "<cmd>NvimTreeToggle<cr>")

--- symbols-outline
vim.keymap.set('n', '<c-d>', "<cmd>SymbolsOutline<cr>")

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[e', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']e', vim.diagnostic.goto_next)
