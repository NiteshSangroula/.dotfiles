-- require'lspconfig'.clangd.setup{}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local nvim_lsp = require('lspconfig')
local servers = { 'clangd', 'tsserver', 'sumneko_lua' }

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {

        capabilities = capabilities,

        on_attach = function()
            print("Hello nitesh")
            vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })

            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
            vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })

            vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, { buffer = 0 })
            vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, { buffer = 0 })

            vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = 0 })
            vim.keymap.set("n", "<leader>a", vim.lsp.buf.formatting, { buffer = 0 })

            vim.keymap.set("n", "<leader>l", "<cmd>Telescope diagnostics<CR>", { buffer = 0 })

            vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics, {
                -- Enable underline, use default values
                underline = true,
                -- Enable virtual text, override spacing to 4
                virtual_text = {
                    spacing = 4,
                },
                -- Use a function to dynamically turn signs off
                -- and on, using buffer local variables
                signs = function(namespace, bufnr)
                    return vim.b[bufnr].show_signs == true
                end,
                -- Disable a feature
                update_in_insert = true,
            }
            )

        end
    }
end

-- LSP AUTOCOMPLETE

vim.opt.completeopt = { "menu", "menuone", "noselect" } -- setting vim values

--setting up nvim-cmp
local cmp = require 'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
    }, {
        { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})
