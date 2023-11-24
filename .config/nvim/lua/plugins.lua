-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use "lewis6991/impatient.nvim" -- Speed up loading Lua modules 
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "rcarriga/nvim-notify" -- notify
  use "kyazdani42/nvim-web-devicons" -- icons

  -- telscope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-live-grep-args.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
    },
    config = function()
      require("telescope").load_extension("live_grep_args")
    end
  }

  use 'skywind3000/asynctasks.vim'
  use 'skywind3000/asyncrun.vim'

  -- Treesittetr
  use {
    "nvim-treesitter/nvim-treesitter",
  }
  use {
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  } -- enhance texetobject selection
  -- use "romgrk/nvim-treesitter-context" -- show class/function at the top
  -- -- use "m-demare/hlargs.nvim"
  -- -- use "SmiteshP/nvim-gps" -- statusline shows class structure
  -- use "andymass/vim-matchup"
  -- use {
  --   "abecodes/tabout.nvim",
  --   wants = { 'vim-treesitter' }, -- or require if not used so far
  -- }
  
  --use {
  --  'phaazon/hop.nvim',
  --  branch = 'v2', -- optional but strongly recommended
  --  config = function()
  --    -- you can configure Hop the way you like here; see :h hop-config
  --    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
  --  end
  --}

  -- LSP
  use "neovim/nvim-lspconfig" -- Collection of configurations for built-in LSP client 
  
  --use({
  --  "glepnir/lspsaga.nvim",
  --  opt = true,
  --  branch = "main",
  --  event = "LspAttach",
  --  config = function()
  --      require("lspsaga").setup({})
  --  end,
  --  requires = {
  --      {"nvim-tree/nvim-web-devicons"},
  --      --Please make sure you install markdown and markdown_inline parser
  --      {"nvim-treesitter/nvim-treesitter"}
  --  }
  --})
  -- cmp
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp" 
  use "onsails/lspkind-nvim"
  -- vsnip
  use 'hrsh7th/cmp-vsnip'    -- { name = 'vsnip' }
  use 'hrsh7th/vim-vsnip'
  use 'rafamadriz/friendly-snippets'

  use { 'j-hui/fidget.nvim', tag = 'legacy',}
  -- Debugger                
  use "ravenxrz/DAPInstall.nvim" -- help us install several debuggers
  use "ravenxrz/nvim-dap" --
  use "theHamsta/nvim-dap-virtual-text"
  use "rcarriga/nvim-dap-ui"
  use { "jbyuki/one-small-step-for-vimkind", module = "osv" } -- debug any Lua code running in a Neovim instance
  use "nvim-telescope/telescope-dap.nvim"
  --use {                    --
  --  "ravenxrz/nvim-gdb",   --
  --  run = "./install.sh"
  --}
  
  use "nvim-tree/nvim-tree.lua"
  use "github/copilot.vim"

  use 'simrat39/symbols-outline.nvim'
end)
