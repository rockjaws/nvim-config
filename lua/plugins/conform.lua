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
      
      -- C# formatting
      cs = { "csharpier" },
    },
    
    -- Format on save
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
}
