return {
    {
        "folke/tokyonight.nvim",
        config = function()
            vim.cmd.colorscheme "tokyonight"
        end
    },
    {
        "echasnovski/mini.icons",
        opts = {},
        init = function()
            package.preload["nvim-web-devicons"] = function()
                require("mini.icons").mock_nvim_web_devicons()
                return package.loaded["nvim-web-devicons"]
            end
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "echasnovski/mini.icons",
        },
        opts = {
            theme = 'tokyonight',
        }
    },
}
