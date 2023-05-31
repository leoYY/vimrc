-- nvim-treesitter configs
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "cpp", "java" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "python", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-- require'hop'.setup()

-- telescope
local telescope = require('telescope').setup {
    defaults = {
        -- 配置文件查找器
        file_finder = require('telescope.finders').fd,
        -- 配置文件预览器
        file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        -- 配置文件选择器
        file_sorter = require('telescope.sorters').get_fuzzy_file,
        -- 配置文件主题
        theme = 'ivy',
        -- 配置 lsp 功能
        lsp_code_actions = true,
        lsp_document_diagnostics = false,
        lsp_document_symbols = true,
        lsp_dynamic_workspace_symbols = true,
        lsp_references = true,
        lsp_rename = true,
        lsp_type_definitions = true,
        lsp_implementations = true,
        lsp_workspace_diagnostics = true,
    },
}

-- cmp
local lspkind = require('lspkind')
local cmp = require'cmp'

--cmp.setup {
--  -- 指定 snippet 引擎
--  snippet = {
--    expand = function(args)
--      -- For `vsnip` users.
--      vim.fn["vsnip#anonymous"](args.body)
--
--      -- For `luasnip` users.
--      -- require('luasnip').lsp_expand(args.body)
--
--      -- For `ultisnips` users.
--      -- vim.fn["UltiSnips#Anon"](args.body)
--
--      -- For `snippy` users.
--      -- require'snippy'.expand_snippet(args.body)
--    end,
--  },
--  -- 来源
--  sources = cmp.config.sources({
--      { name = 'nvim_lsp' },
--      -- For vsnip users.
--      { name = 'vsnip' },
--      -- For luasnip users.
--      -- { name = 'luasnip' },
--      --For ultisnips users.
--      -- { name = 'ultisnips' },
--      -- -- For snippy users.
--      -- { name = 'snippy' },
--      { name = 'nvim_lsp_signature_help' }
--    }, 
--    { 
--      { name = 'buffer' },
--      { name = 'path' }
--    }
--  ),
--
--  -- 快捷键
--  -- mapping = require'keybindings'.cmp(cmp),
--  ---- 使用lspkind-nvim显示类型图标
--  formatting = {
--    format = lspkind.cmp_format({
--      with_text = true, -- do not show text alongside icons
--      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
--      before = function (entry, vim_item)
--        -- Source 显示提示来源
--        vim_item.menu = "["..string.upper(entry.source.name).."]"
--        return vim_item
--      end
--    })
--  },
--  completion = {
--    completeopt = 'menu,menuone,noinsert',
--    keyword_length = 2,
--    trigger_characters = { '.', '::', '->' },
--  },
--}
--
---- Use buffer source for `/`.
--cmp.setup.cmdline('/', {
--  sources = {
--    { name = 'buffer' }
--  }
--})
--
---- Use cmdline & path source for ':'.
--cmp.setup.cmdline(':', {
--  sources = cmp.config.sources({
--    { name = 'path' }
--  }, {
--      { name = 'cmdline' }
--    })
--})

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-o>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  }),
  formatting = {
    format = lspkind.cmp_format({
      with_text = true, -- do not show text alongside icons
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      before = function (entry, vim_item)
        -- Source 显示提示来源
        vim_item.menu = "["..string.upper(entry.source.name).."]"
        return vim_item
      end
    })
  }
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

vim.lsp.set_log_level("debug")

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- lsp
vim.diagnostic.config({virtual_text = false})

require'lspconfig'.clangd.setup{
  -- cmd = { "/opt/homebrew/opt/llvm@14/bin/clangd", "--background-index", "--clang-tidy", "--completion-style=bundled", "--header-insertion=iwyu", "--suggest-missing-includes", "--pch-storage=memory" }
  capabilities = capabilities,
  --on_attach = function(client)
  --  client.resolved_capabilities.document_formatting = false
  --  on_publish_diagnostics(client)
  --end
}

require'fidget'.setup {}

require'nvim-tree'.setup {}
