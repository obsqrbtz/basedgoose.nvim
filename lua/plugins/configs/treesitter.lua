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
    local ok, ts = pcall(require, 'nvim-treesitter')

    -- `install()` and `indentexpr()` only exist on the `main` branch. A clone made
    -- before `branch = 'main'` was pinned stays on `master` until `:Lazy update`
    -- runs, so degrade to core treesitter instead of erroring on every startup.
    local has_main_api = ok and type(ts.install) == 'function'
    if not has_main_api then
      vim.schedule(function()
        vim.notify(
          'nvim-treesitter is not on the `main` branch; run `:Lazy update nvim-treesitter` to sync it.',
          vim.log.levels.WARN
        )
      end)
    end

    local function install_parsers()
      if has_main_api and vim.fn.executable 'tree-sitter' == 1 then
        ts.install(ensure_installed)
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
        if has_main_api then
          vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
