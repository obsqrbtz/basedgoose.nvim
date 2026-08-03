-- Server definitions shared between the LSP setup and mason.
return {
  clangd = {},
  pyright = {},
  rust_analyzer = {},
  ts_ls = {},
  nil_ls = {},
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
      },
    },
  },
}
