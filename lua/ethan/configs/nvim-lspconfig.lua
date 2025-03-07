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
            local telescope = require('telescope.builtin')

            require('which-key').register({
                g = {
                    d = {
                        function()
                            trouble.toggle('lsp_definitions')
                        end,
                        'Goto Definition',
                    },
                    r = {
                        function()
                            trouble.toggle('lsp_references')
                        end,
                        'Goto References',
                    },
                    i = { telescope.lsp_implementations, 'Goto Implementation' },
                    t = {
                        function()
                            trouble.toggle('lsp_type_definitions')
                        end,
                        'Goto Type Definition',
                    },
                    D = { vim.lsp.buf.declaration, 'Goto Declaration' },
                },
                ['<leader>'] = {
                    S = {
                        name = 'symbols',
                        d = { telescope.lsp_document_symbols, 'Document Symbols' },
                        w = { telescope.lsp_dynamic_workspace_symbols, 'Workspace Symbols' },
                    },
                    ['rn'] = { vim.lsp.buf.rename, 'Rename' },
                    ['ca'] = { vim.lsp.buf.code_action, 'Code Action' },
                    x = {
                        name = 'trouble',
                        x = {
                            function()
                                trouble.toggle()
                            end,
                            'Toggle Trouble',
                        },
                        q = {
                            function()
                                trouble.toggle('quickfix')
                            end,
                            'Toggle Quickfix',
                        },
                        l = {
                            function()
                                trouble.toggle('loclist')
                            end,
                            'Toggle Location List',
                        },
                        w = {
                            function()
                                trouble.toggle('workspace_diagnostics')
                            end,
                            'Toggle Workspace Diagnostics',
                        },
                        d = {
                            function()
                                trouble.toggle('document_diagnostics')
                            end,
                            'Toggle Document Diagnostics',
                        },
                    },
                },
                ['[d'] = { vim.diagnostic.goto_prev, 'Goto Previous Diagnostic Message' },
                [']d'] = { vim.diagnostic.goto_next, 'Goto Next Diagnostic Message' },
            }, { buffer = event.buf, silent = true, mode = 'n' })

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

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities =
        vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

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
