return {
  'neovim/nvim-lspconfig',
  dependencies = { 'saghen/blink.cmp' },
  config = function()
    local utils = require 'utils'
    local servers = require 'plugins.configs.lsp.servers'

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end
        map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
        map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
        map('grr', require('fzf-lua').lsp_references, '[G]oto [R]eferences')
        map('gri', require('fzf-lua').lsp_implementations, '[G]oto [I]mplementation')
        map('grd', require('fzf-lua').lsp_definitions, '[G]oto [D]efinition')
        map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        map('gO', require('fzf-lua').lsp_document_symbols, 'Open Document Symbols')
        map('gW', require('fzf-lua').lsp_workspace_symbols, 'Open Workspace Symbols')
        map('grt', require('fzf-lua').lsp_typedefs, '[G]oto [T]ype Definition')

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if not client then
          return
        end

        if client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
          local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })
          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
            end,
          })
        end

        if client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
          map('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
          end, '[T]oggle Inlay [H]ints')
        end
      end,
    })

    vim.lsp.config('*', {
      capabilities = require('blink.cmp').get_lsp_capabilities(nil, true),
    })

    for name, config in pairs(servers) do
      vim.lsp.config(name, config)
    end
    if utils.is_nixos() then
      vim.lsp.enable(vim.tbl_keys(servers))
    end
  end,
}
