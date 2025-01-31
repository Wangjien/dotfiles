return {
    { ---- colorscheme.
        "sainnhe/gruvbox-material",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            vim.cmd([[
            " https://github.com/sainnhe/gruvbox-material/blob/master/doc/gruvbox-material.txt
            " Important!!
            " For dark version.
            set background=dark
            " Set contrast.
            " This configuration option should be placed before `colorscheme gruvbox-material`.
            " Available values: 'hard', 'medium'(default), 'soft'
            let g:gruvbox_material_background = 'hard'
            " For better performance
            let g:gruvbox_material_better_performance = 1

            let g:gruvbox_material_diagnostic_text_highlight = 1
            " let g:gruvbox_material_diagnostic_line_highlight = 1
            let g:gruvbox_material_diagnostic_virtual_text = "colored"
            let g:gruvbox_material_sign_column_background = 'none'

            colorscheme gruvbox-material
            ]])
        end
    }, { ---- A plugin show neovim startup time.
        "dstein64/vim-startuptime",
        event = "VeryLazy",
        cmd = "StartupTime",
        config = function() vim.g.startuptime_tries = 10 end
    }, { ---- enhance jk.
        "max397574/better-escape.nvim",
        event = "VeryLazy",
        config = function()
            require("better_escape").setup {
                mapping = {"jk", "jj"}, -- a table with mappings to use
                timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
                clear_empty_lines = false, -- clear line after escaping if there is only whitespace
                keys = "<Esc>" -- keys used for escaping, if it is a function will use the result everytime
                -- example(recommended)
                -- keys = function()
                --   return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
                -- end,
            }
        end
    }, { ---- auto save file.
        "907th/vim-auto-save",
        event = "VeryLazy",
        enabled = true,
        config = function()
            vim.cmd([[
		let g:auto_save = 1
		let g:auto_save_events = ["ExitPre", "BufLeave", "WinLeave"]
			]])
        end
    }, { ---- A markdonw online real-time preview plugin.
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        config = function() vim.g.mkdp_filetypes = {"markdown"} end,
        ft = {"markdown"}
    }, { ---- Read or write file with sudo.
        "lambdalisue/suda.vim",
        event = "VeryLazy"
    }, { ---- A plugin show code outline.
        "preservim/tagbar",
        ft = {"markdown", "go", "lua"},
        config = function()
            vim.cmd([[
			let g:tagbar_show_tag_count = 1
			let g:tagbar_autoshowtag = 1
			let g:tagbar_wrap = 1
			let g:tagbar_zoomwidth = 0
			let g:tagbar_show_linenumbers = 0
			let g:tagbar_autofocus = 0
			let g:tagbar_sort = 0
			let g:tagbar_map_togglesort = "r"
			let g:tagbar_help_visibility = 0
			let g:tagbar_show_data_type = 1
			let g:tagbar_autopreview = 0
            ]])
        end
    }, { ---- Symbol auto pair.
        "m4xshen/autoclose.nvim",
        event = "VeryLazy",
        config = function() require("autoclose").setup({}) end
    }, { ---- Auto generate some comments.
        "danymat/neogen",
        event = "VeryLazy",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = true
        -- Uncomment next line if you want to follow only stable versions
        -- version = "*"
    }, { ---- Quikly comment plugin.
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        config = function() require('Comment').setup() end
    }, { ---- Multiple cursors plugin for vim/neovim
        "mg979/vim-visual-multi",
        event = "VeryLazy",
        config = function()
            vim.cmd([[
				let g:VM_maps = {}
				let g:VM_maps['Find Under']         = '<cr>'           " replace C-n
				let g:VM_maps['Find Subword Under'] = '<cr>'           " replace visual C-n
				let g:VM_mouse_mappings = 1
				let g:VM_theme = 'iceblue'
				let g:VM_highlight_matches = 'underline'
				]])

        end
    }, { ---- Undo tree.
        "mbbill/undotree",
        event = "VeryLazy"
    }, { ---- Just a translate plugin.
        "voldikss/vim-translator",
        event = "VeryLazy",
        config = function()
            vim.cmd([[
            let g:translator_target_lang = 'zh'
            ]])
        end
    }, { ---- Format file.
        "sbdchd/neoformat",
        ft = {"go", "lua"},
        config = function()
            vim.cmd([[
			augroup fmt
			autocmd!
			autocmd BufWritePre *.go Neoformat goimports | Neoformat gofumpt
			autocmd BufWritePre *.sh Neoformat
			augroup END
			" " ignore error
			let g:neoformat_only_msg_on_error = 1
        ]])
        end
    }, { ---- Jump to wherever you want.
        "phaazon/hop.nvim",
        event = "VeryLazy",
        config = function() require'hop'.setup() end
    },
    { ---- > An efficient fuzzy finder that helps to locate files, buffers, mrus, gtags, etc. on the fly for both vim and neovim.
        "Yggdroot/LeaderF",
        event = "VeryLazy",
        config = function()
            vim.cmd([[
            let g:Lf_HideHelp = 1
            let g:Lf_UseCache = 0
            let g:Lf_UseVersionControlTool = 0
            let g:Lf_IgnoreCurrentBufferName = 1
            " Show icons, icons are shown by default
            let g:Lf_ShowDevIcons = 1
            " popup mode
            let g:Lf_WindowPosition = 'popup'
            let g:Lf_PreviewInPopup = 1
            let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
            let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
            let g:Lf_WildIgnore = {
                \ 'dir': ['.git', 'node_modules'],
                \ 'file': []
                \}

                let g:Lf_RootMarkers = ['.git', '.gitignore', 'node_modules']
                " mode explain: https://github.com/Yggdroot/LeaderF/blob/master/doc/leaderf.txt#L485-L497
                let g:Lf_WorkingDirectoryMode = 'A'

                let g:Lf_ShortcutF = "<leader>ff"
            ]])
        end
    }, {"williamboman/mason-lspconfig.nvim"}, {
        ---- A code preview plugin.
        "rmagatti/goto-preview",
        config = function()
            require('goto-preview').setup {
                width = 120, -- Width of the floating window
                height = 15, -- Height of the floating window
                border = {
                    "↖", "─", "┐", "│", "┘", "─", "└", "│"
                }, -- Border characters of the floating window
                default_mappings = false, -- Bind default mappings
                debug = false, -- Print debug information
                opacity = 0, -- 0-100 opacity level of the floating window where 100 is fully transparent.
                resizing_mappings = false, -- Binds arrow keys to resizing the floating window.
                post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
                -- references = { -- Configure the telescope UI for slowing the references cycling window.
                --   telescope = telescope.themes.get_dropdown({ hide_preview = false })
                -- };
                -- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality
                focus_on_open = true, -- Focus the floating window when opening it.
                dismiss_on_move = false, -- Dismiss the floating window when moving the cursor.
                force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
                bufhidden = "wipe" -- the bufhidden option to set on the floating window. See :h bufhidden
            }
        end
    }, { ---- Async run a custom command.
        "skywind3000/asyncrun.vim",
        ft = {"go", "lua", "tex"}
    }, -- {
    -- 	"echasnovski/mini.nvim",
    -- 	lazy = false,
    -- 	config = function()
    -- 		require('mini.cursorword').setup()
    -- 	end
    -- },
    { ---- Show current cursor word.
        "xiyaowong/nvim-cursorword",
        event = "VeryLazy",
        enabled = true,
        config = function()
            vim.cmd([[
			hi default CursorWord cterm=underline gui=underline
			let g:cursorword_disable_filetypes = []
			let g:cursorword_min_width = 3
			]])
        end
    },
    { ---- > 🍁 Fun little plugin that can be used as a screensaver and on your dashboard
        "folke/drop.nvim",
        event = "VimEnter",
        ft = {"dashboard"},
        config = function() require("drop").setup() end
    }, { ---- colorizer your neovim.
        "norcalli/nvim-colorizer.lua",
        event = "VeryLazy",
        config = function()
            require'colorizer'.setup({'*'}, {
                RGB = true, -- #RGB hex codes
                RRGGBB = true, -- #RRGGBB hex codes
                names = true, -- "Name" codes like Blue
                RRGGBBAA = true, -- #RRGGBBAA hex codes
                rgb_fn = true, -- CSS rgb() and rgba() functions
                hsl_fn = true, -- CSS hsl() and hsla() functions
                css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
                -- Available modes: foreground, background
                mode = 'background' -- Set the display mode.})
                --[[ #558817
			-- Red Blue Yellow
			--]]
            })
        end
    }, { ---- cool standalone UI for nvim-lsp progress
        "j-hui/fidget.nvim",
        ft = {"lua", "go"},
        config = true
    }, { ---- session manager
        "Shatur/neovim-session-manager",
        event = "VeryLazy",
        keys = {
            {
                "<leader>ss",
                "<cmd>SessionManager save_current_session<CR>",
                desc = "save session"
            }, {
                "<leader>sl",
                "<cmd>SessionManager load_last_session<CR>",
                desc = "load last session"
            },
            {
                "<leader>sc",
                "<cmd>SessionManager load_session<CR>",
                desc = "load session"
            }, {
                "<leader>sd",
                "<cmd>SessionManager delete_session<CR>",
                desc = "delete session"
            }
        },
        opts = function()
            return {
                autoload_mode = require("session_manager.config").AutoloadMode
                    .Disabled,
                autosave_last_session = false
            }
        end
    }
}
