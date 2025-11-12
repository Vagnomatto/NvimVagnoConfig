-- plugin/alpha.lua
return {
    'goolord/alpha-nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    event = 'VimEnter',
    config = function()
        local alpha = require 'alpha'
        local dashboard = require 'alpha.themes.dashboard'

        local asii = [[
██╗   ██╗ █████╗  ██████╗ ███╗   ██╗ ██████╗ 
██║   ██║██╔══██╗██╔════╝ ████╗  ██║██╔═══██╗
██║   ██║███████║██║  ███╗██╔██╗ ██║██║   ██║
╚██╗ ██╔╝██╔══██║██║   ██║██║╚██╗██║██║   ██║
 ╚████╔╝ ██║  ██║╚██████╔╝██║ ╚████║╚██████╔╝
  ╚═══╝  ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝ 
                                             
        ]]

        -- Colore singolo per tutto l’ASCII
        vim.api.nvim_set_hl(0, "AlphaLogo", { fg = "#8b00ff" })

        local var_header = vim.split(asii, '\n')
        dashboard.section.header.val = var_header
        dashboard.section.header.opts.hl = "AlphaLogo"

        local settings_path = vim.fn.stdpath('config')
        dashboard.section.buttons.val = {
            dashboard.button("f", "󰈞  Find file", ":Telescope find_files <CR>"),
            dashboard.button("p", "󰄉  Projects", ":Telescope projects <CR>"),
            dashboard.button('s', '  Settings', ':cd ' .. settings_path .. '<CR>:e init.lua<CR>'),
            dashboard.button('q', '󰿅  Quit', '<cmd>q<CR>'),
        }

        dashboard.section.footer.val = {
            '', 'Python is trash'
        }

        dashboard.opts.opts.noautocmd = true
        alpha.setup(dashboard.opts)
    end,
}
