local ensure_installed = {
  'bash',
  'c',
  'cpp',
  'diff',
  'html',
  'lua',
  'luadoc',
  'markdown',
  'markdown_inline',
  'nix',
  'python',
  'query',
  'rust',
  'toml',
  'typescript',
  'vim',
  'vimdoc',
  'yaml',
}

return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local function install_parsers()
      if vim.fn.executable 'tree-sitter' == 1 then
        require('nvim-treesitter').install(ensure_installed)
      end
    end

    vim.api.nvim_create_autocmd('User', {
      pattern = 'MasonToolsUpdateCompleted',
      group = vim.api.nvim_create_augroup('treesitter-install', { clear = true }),
      callback = install_parsers,
    })
    install_parsers()

    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('treesitter-start', { clear = true }),
      callback = function(event)
        local lang = vim.treesitter.language.get_lang(vim.bo[event.buf].filetype)
        if not lang or not pcall(vim.treesitter.start, event.buf, lang) then
          return
        end
        vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
