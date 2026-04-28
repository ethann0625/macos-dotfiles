vim.o.pumheight = 10

vim.api.nvim_create_user_command(
    "ToggleInlay",
    function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end,
    { nargs = 0}
)

vim.api.nvim_create_user_command(
    "Fmt",
    function()
        vim.lsp.buf.format()
    end,
    { nargs = 0}
)

vim.lsp.inlay_hint.enable(false)

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        local opts = { buffer = event.buf }
        vim.keymap.set('n', '`',          vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'g`',         vim.diagnostic.open_float, opts)
        vim.keymap.set('n', 'gd',         vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gD',         vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gi',         vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'go',         vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', 'gr',         vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'gs',         vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<F2>',       vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<F4>',       vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '[d',         vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', ']d',         vim.diagnostic.goto_next, opts)
    end
})

require('mason').setup({})
require('mason-lspconfig').setup({
    handlers = {
        function(server_name)
            vim.lsp.config(server_name, {
                capabilities = lsp_capabilities,
            })
        end,
    }
})

local cmp = require('cmp')
local luasnip = require('luasnip')

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
    sources = {
        {name = 'path'},
        {name = 'nvim_lsp'},
        {name = 'nvim_lsp_signature_help'},
        {name = 'luasnip', keyword_length = 2},
        {name = 'buffer', keyword_length = 3},
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Tab>'] = cmp.mapping.complete(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-f>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then luasnip.jump(1) else fallback() end
        end, { 'i', 's' }),
        ['<C-b>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then luasnip.jump(-1) else fallback() end
        end, { 'i', 's' }),
    }),
})

vim.lsp.config('lua_ls', {
    capabilities = lsp_capabilities,
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            workspace = {
                checkThirdParty = false,
                library = { vim.env.VIMRUNTIME }
            }
        }
    }
})

vim.lsp.config('pyright', {
    settings = {
        python = {
            pythonPath = "/usr/local/bin/python3"
        }
    }
})

vim.lsp.config('jdtls', {
    settings = {
      java = {
        import = {
          gradle = { enabled = true }
        }
      }
    }
})
-- local javafx_path = "/path/to/javafx-sdk/lib" -- or resolve from gradle cache
-- require('jdtls').start_or_attach({
--   settings = {
--     java = {
--       configuration = {
--         runtimes = { ... }
--       }
--     }
--   },
--   init_options = {
--     bundles = {},
--   },
--   cmd = {
--     "java",
--     "--add-modules=ALL-SYSTEM",
--     "-Declipse.application=org.eclipse.jdt.ls.core.id1",
--   }
-- })

vim.lsp.config('digestif', {
    filetypes = { "tex", "plaintex", "latex" }
})

vim.lsp.config('ltex', {
    filetypes = { "bib", "gitcommit", "markdown", "org", "plaintex", "rst", "rnoweb", "tex", "pandoc", "quarto", "rmd", "context", "html", "xhtml", "mail", "text", "latex" },
    settings = {
        ltex = {
            language = "en-us",
            dictionary = {
                ["sk-SK"] =  { "vzorák" }
            },
            disabledRules = {
                ["sk-SK"] = { "POCITACOVE_UVODZOVKY", "AKO" }
            }
        }
    }
})

vim.lsp.config('texlab', {
    filetypes = { "tex", "plaintex", "latex", "bib" }
})

vim.lsp.config('rust_analyzer', {
    settings = {
        ['rust-analyzer'] = {
            check = {
                command = "clippy";
            },
            diagnostics = {
                enable = true;
            },
        }
    }
})

vim.lsp.enable({ 'pyright', 'jdtls' })

local old_enum = vim.api.nvim_get_hl(0, { name = "@lsp.type.enumMember" })
