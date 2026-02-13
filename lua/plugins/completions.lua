return {
    "saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",
    version = "*",
    opts = {
        keymap = {
            preset = "default",
            ["<CR>"] = { "accept", "fallback" },
            ["<Tab>"] = { "select_next", "fallback" },
            ["<S-Tab>"] = { "select_prev", "fallback" },
        },
        
        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
        },
        
        completion = {
            accept = {
                auto_brackets = {
                    enabled = true,
                },
            },
            menu = {
                max_height = 10,
                border = "rounded",
                scrollbar = true,
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 200,
                window = {
                    border = "rounded",
                },
            },
            list = {
                selection = { preselect = true, auto_insert = true },  -- Changed to table format
            },
        },
        
        sources = {
            default = { "lsp", "path", "buffer" },
            providers = {
                lsp = {
                    name = "LSP",
                    module = "blink.cmp.sources.lsp",
                    score_offset = 1000,
                    transform_items = function(_, items)
                        return vim.tbl_filter(function(item)
                            return item.kind ~= require("blink.cmp.types").CompletionItemKind.Text
                        end, items)
                    end,
                },
                path = {
                    name = "Path",
                    module = "blink.cmp.sources.path",
                    score_offset = 300,
                },
                buffer = {
                    name = "Buffer",
                    module = "blink.cmp.sources.buffer",
                    score_offset = 50,
                    min_keyword_length = 4,
                    max_items = 5,
                },
            },
        },
    },
}
