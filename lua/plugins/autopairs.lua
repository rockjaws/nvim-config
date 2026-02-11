return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
        local npairs = require('nvim-autopairs')
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local cmp = require('cmp')
        
        -- Setup nvim-autopairs
        npairs.setup({
            check_ts = true,
            ts_config = {
                lua = { 'string' },
                javascript = { 'template_string' },
                typescript = { 'template_string' },
                cs = { 'string', 'interpolated_string_expression' },  -- Added C#
            },
            disable_filetype = { "TelescopePrompt", "spectre_panel", "vim" },
            disable_in_macro = true,
            disable_in_visualblock = false,
            disable_in_replace_mode = true,
            ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
            enable_moveright = true,
            enable_afterquote = true,
            enable_check_bracket_line = true,
            enable_bracket_in_quote = true,
            enable_abbr = false,
            break_undo = true,
            map_cr = true,
            map_bs = true,
            map_c_h = false,
            map_c_w = false,
        })
        
        -- Add auto-insert `()` after selecting function/method from completion
        cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
        )
    end
}
