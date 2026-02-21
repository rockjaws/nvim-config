vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'javascriptreact', 'typescriptreact' },
    callback = function() vim.treesitter.start() end,
})

vim.o.updatetime = 500

vim.diagnostic.config({
    float = {
        focusable = false,
        scope = 'cursor',
        close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter' },
    },
    update_in_insert = false,
})

vim.api.nvim_create_autocmd('CursorHold', {
    callback = function()
        vim.diagnostic.open_float()
    end,
})
