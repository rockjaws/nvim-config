return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      javascript = { "biome" },
      typescript = { "biome" },
      javascriptreact = { "biome" },
      typescriptreact = { "biome" },
      json = { "biome" },
      jsonc = { "biome" },
      
      cs = { "csharpier" },

      zig = { "zigfmt" },
    },

    format_on_save = {
      timeout_ms = 3000,
      lsp_format = "fallback",
    },
  },
}
