return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
    },
    config = function()
        local cmp = require("cmp")
        cmp.setup({
            preselect = cmp.PreselectMode.Item,
            completion = { 
                completeopt = "menu,menuone,noinsert",
            },
            window = { 
                documentation = cmp.config.window.bordered(),
                completion = cmp.config.window.bordered({
                    max_height = 10,
                }),
            },
            sorting = {
                priority_weight = 2,
                comparators = {
                    cmp.config.compare.locality,
                    cmp.config.compare.recently_used,
                    cmp.config.compare.score,
                    cmp.config.compare.offset,
                    cmp.config.compare.exact,
                    cmp.config.compare.scopes,
                    cmp.config.compare.kind,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.order,
                },
            },
            matching = {
                disallow_fuzzy_matching = false,
                disallow_partial_matching = false,
                disallow_prefix_unmatching = true,
            },
            performance = {
                max_view_entries = 10,
            },
            mapping = cmp.mapping.preset.insert({
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
            sources = cmp.config.sources({
                { 
                    name = "nvim_lsp",
                    priority = 1000,
                    entry_filter = function(entry, ctx)
                        local kind = require("cmp.types").lsp.CompletionItemKind[entry:get_kind()]
                        if kind == "Text" then
                            return false
                        end
                        return true
                    end,
                },
                { name = "path", priority = 300 },
            }, {
                { 
                    name = "buffer",
                    priority = 50,
                    keyword_length = 4,
                    option = {
                        get_bufnrs = function()
                            return { vim.api.nvim_get_current_buf() }
                        end,
                    },
                    max_item_count = 5,
                },
            }),
        })
    end
}
