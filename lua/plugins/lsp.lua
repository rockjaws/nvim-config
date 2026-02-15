return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "seblj/roslyn.nvim",
        "saghen/blink.cmp",
    },
    config = function()
        require("mason").setup({
            registries = {
                "github:mason-org/mason-registry",
                "github:Crashdummyy/mason-registry",
            },
        })
        
        require("mason-lspconfig").setup({
            ensure_installed = { "ts_ls", "zls" },
        })
        local capabilities = require("blink.cmp").get_lsp_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true
        
        vim.lsp.config("ts_ls", {
            capabilities = capabilities,
            cmd = { "typescript-language-server", "--stdio" },
            filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
            root_markers = { "package.json", "tsconfig.json", "jsconfig.json" },
        })
        vim.lsp.enable("ts_ls")

	vim.lsp.config("zls", {
            capabilities = capabilities,
            cmd = { "zls" },
            filetypes = { "zig", "zir" },
            root_markers = { "zls.json", "build.zig", ".git" },
        })
        vim.lsp.enable("zls")
        
        require("roslyn").setup({
            capabilities = capabilities,
        })
        
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local opts = { buffer = ev.buf }
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            end,
        })
    end,
}
