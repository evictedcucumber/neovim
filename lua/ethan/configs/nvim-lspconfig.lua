local M = {}

M.servers = {
    lua_ls = {
        filetypes = { 'lua' },
        options = {
            Lua = {
                diagnostics = {
                    globals = { 'vim' },
                    disable = { 'missing-fields' },
                },
                workspace = {
                    library = {
                        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                        [vim.fn.stdpath('config') .. '/lua'] = true,
                    },
                },
                completion = {
                    callSnippet = 'Replace',
                },
            },
        },
    },
    pyright = {
        filetypes = { 'python' },
    },
    texlab = {
        filetypes = { 'tex' },
    },
    cssls = {
        filetypes = { 'css' },
    },
    jsonls = {
        filetypes = { 'json' },
    },
}

M.setup = function()
    vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('EthanLspConfig', {}),
        callback = function(event)
            local trouble = require('trouble')

            vim.keymap.set('n', 'gd', function()
                trouble.toggle('lsp_definitions')
            end, { buffer = event.buf, desc = 'Goto Definition' })
            vim.keymap.set('n', 'gr', function()
                trouble.toggle('lsp_references')
            end, { buffer = event.buf, desc = 'Goto References' })
            vim.keymap.set('n', '<leader>vws', function()
                trouble.toggle('lsp_document_symbols')
            end, { buffer = event.buf, desc = 'View Document Symbols' })
            vim.keymap.set(
                'n',
                '<leader>rn',
                vim.lsp.buf.rename,
                { buffer = event.buf, desc = 'Rename' }
            )
            vim.keymap.set(
                'n',
                '<leader>ca',
                vim.lsp.buf.code_action,
                { buffer = event.buf, desc = 'Code Actions' }
            )
            vim.keymap.set(
                'n',
                '[d',
                vim.diagnostic.goto_prev,
                { buffer = event.buf, desc = 'Goto Previous Diagnostic Message' }
            )
            vim.keymap.set(
                'n',
                ']d',
                vim.diagnostic.goto_next,
                { buffer = event.buf, desc = 'Goto Next Diagnostic Message' }
            )
            vim.keymap.set(
                'n',
                'K',
                vim.lsp.buf.hover,
                { buffer = event.buf, desc = 'Show Hover Documentation' }
            )
            vim.keymap.set(
                'i',
                '<C-h>',
                vim.lsp.buf.signature_help,
                { buffer = event.buf, desc = 'Show Signature Help' }
            )
            vim.keymap.set(
                'n',
                '<leader>tt',
                trouble.toggle,
                { buffer = event.buf, desc = 'Toggle Trouble' }
            )
            vim.keymap.set('n', '[t', function()
                trouble.next({ skip_groups = true, jump = true })
            end, { buffer = event.buf, desc = 'Goto Next Trouble Item' })
            vim.keymap.set('n', ']t', function()
                trouble.previous({ skip_groups = true, jump = true })
            end, { buffer = event.buf, desc = 'Goto Previous Trouble Item' })

            local client = vim.lsp.get_client_by_id(event.data.client_id)
            if client and client.server_capabilities.documentHighlightProvider then
                vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                    buffer = event.buf,
                    callback = vim.lsp.buf.document_highlight,
                })

                vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                    buffer = event.buf,
                    callback = vim.lsp.buf.clear_references,
                })
            end
        end,
    })

    local capabilities = vim.tbl_deep_extend(
        'force',
        {},
        vim.lsp.protocol.make_client_capabilities(),
        require('cmp_nvim_lsp').default_capabilities()
    )

    require('mason-lspconfig').setup_handlers({
        function(server_name)
            local server = M.servers[server_name] or {}

            server.capabilities = capabilities
            require('lspconfig')[server_name].setup(server)
        end,
    })

    local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
    for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
    end

    vim.diagnostic.config({
        underline = true,
    })
end

return M
