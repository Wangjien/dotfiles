local M = {
    "glepnir/lspsaga.nvim",
    ft = {"go", "lua"}
    -- commit = "b7b4777"
}

function M.config()

    require("lspsaga").setup({
        ui = {
            border = 'rounded',
            title = true,
            winblend = 0,
            expand = '',
            collapse = '',
            code_action = '💡',
            diagnostic = '🐞',
            incoming = ' ',
            outgoing = ' ',
            hover = ' ',
            kind = {}
        },
        diagnostic = {
            show_code_action = true,
            show_source = true,
            jump_num_shortcut = true,
            max_width = 0.7,
            custom_fix = nil,
            custom_msg = nil,
            text_hl_follow = false,
            keys = {exec_action = 'o', quit = 'q', go_action = 'g'}
        },
        code_action = {num_shortcut = true, keys = {quit = 'q', exec = '<CR>'}},
        lightbulb = {
            enable = true,
            enable_in_insert = true,
            -- cache_code_action = true,
            sign = true,
            sign_priority = 40,
            virtual_text = false
        },
        preview = {lines_above = 0, lines_below = 10},
        scroll_preview = {scroll_down = '<C-f>', scroll_up = '<C-b>'},
        request_timeout = 2000,
        finder = {
            jump_to = 'p',
            edit = {'o', '<CR>'},
            vsplit = 'v',
            split = 's',
            tabe = 't',
            quit = {'q', '<ESC>'}
        },
        definition = {
            edit = '<C-c>o',
            vsplit = '<C-c>v',
            split = '<C-c>i',
            tabe = '<C-c>t',
            quit = 'q',
            close = '<Esc>'
        },
        rename = {
            quit = '<C-c>',
            exec = '<CR>',
            mark = 'x',
            confirm = '<CR>',
            in_select = true
        },
        symbol_in_winbar = {
            enable = false,
            separator = ' ',
            hide_keyword = true,
            show_file = true,
            folder_level = 2,
            respect_root = false,
            color_mode = true
        },
        outline = {
            win_position = 'right',
            win_with = '',
            win_width = 30,
            show_detail = true,
            auto_preview = true,
            auto_refresh = true,
            auto_close = true,
            custom_sort = nil,
            keys = {jump = 'o', expand_collapse = 'u', quit = 'q'}
        },
        callhierarchy = {
            show_detail = false,
            keys = {
                edit = 'e',
                vsplit = 's',
                split = 'i',
                tabe = 't',
                jump = 'o',
                quit = 'q',
                expand_collapse = 'u'
            }
        },
        beacon = {enable = true, frequency = 7},
        server_filetype_map = {}
    })
end

return M
