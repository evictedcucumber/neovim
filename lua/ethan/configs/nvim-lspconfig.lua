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
            local map = function(keys, func, desc)
                vim.keymap.set(
                    'n',
                    keys,
                    func,
                    { desc = 'LSP: ' .. desc, buffer = event.buf, silent = true }
                )
            end

            local trouble = require('trouble')
            local telescope = require('telescope.builtin')

            map('gd', function()
                trouble.toggle('lsp_definitions')
            end, '[G]oto [D]efinition')

            map('gr', function()
                trouble.toggle('lsp_references')
            end, '[G]oto [R]eferences')

            map('gi', telescope.lsp_implementations, '[G]oto [I]mplementation')

            map('gt', function()
                trouble.toggle('lsp_type_definitions')
            end, 'Type [D]efinition')

            map('<leader>ds', telescope.lsp_document_symbols, '[D]ocument [S]ymbols')

            map('<leader>wS', telescope.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

            map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

            map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

            map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

            map('<leader>xx', function()
                trouble.toggle()
            end, 'Toggle Trouble')

            map('<leader>xq', function()
                trouble.toggle('quickfix')
            end, 'Toggle [Q]uickfix List')

            map('<leader>xl', function()
                trouble.toggle('loclist')
            end, 'Toggle [L]ocation List')

            map('<leader>xw', function()
                trouble.toggle('workspace_diagnostics')
            end, 'Toggle [W]orkspace Diagnostics')

            map('<leader>xd', function()
                trouble.toggle('document_diagnostics')
            end, 'Toggle [D]ocument Diagnostics')

            map('[d', vim.diagnostic.goto_prev, 'Goto Previous [D]iagnostic Message')

            map(']d', vim.diagnostic.goto_next, 'Goto Next [D]iagnostic Message')

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
