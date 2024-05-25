local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
    vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', { buffer = bufnr })
    vim.keymap.set('n', '<leader>ds', '<cmd>Telescope lsp_document_symbols<cr>', { buffer = bufnr })
    vim.keymap.set('n', '<leader>ws', '<cmd>Telescope lsp_workspace_symbols<cr>', { buffer = bufnr })
    vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, { buffer = bufnr })
    vim.keymap.set('n', '<leader>fm', function() vim.lsp.buf.format() end, { buffer = bufnr })
end)

-- to learn how to use mason.nvim
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    },
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Select previous and next in the completion menu
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),

        -- Scroll up and down in the completion documentation
        ['<C-d>'] = cmp.mapping.scroll_docs(-1),
        ['<C-u>'] = cmp.mapping.scroll_docs(1),

    }),
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})
