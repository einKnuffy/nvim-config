return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  {
    'akinsho/toggleterm.nvim',
    event = "VimEnter",
    enabled = true,
    config = function()
      require("toggleterm").setup({
        shell = "bash",
        direction = "float"
      })
    end
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = true,
    --[[    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }, ]]
    config = function()
      -- If you want icons for diagnostic errors, you'll need to define them somewhere:
      vim.fn.sign_define("DiagnosticSignError",
        { text = " ", texthl = "DiagnosticSignError" })
      vim.fn.sign_define("DiagnosticSignWarn",
        { text = " ", texthl = "DiagnosticSignWarn" })
      vim.fn.sign_define("DiagnosticSignInfo",
        { text = " ", texthl = "DiagnosticSignInfo" })
      vim.fn.sign_define("DiagnosticSignHint",
        { text = "󰌵", texthl = "DiagnosticSignHint" })

      require("neo-tree").setup({
        close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        enable_normal_mode_for_inputs = false,                             -- Enable normal mode for input dialogs.
        open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- when opening files, do not use windows containing these filetypes or buftypes
        sort_case_insensitive = false,                                     -- used when sorting files and directories in the tree
        sort_function = nil,                                               -- use a custom function for sorting files and directories in the tree
        --[[    source_selector = {
          winbar = true,
        }, ]] --
        -- sort_function = function (a,b)
        --       if a.type == b.type then
        --           return a.path > b.path
        --       else
        --           return a.type > b.type
        --       end
        --   end , -- this sorts files and directories descendantly
        default_component_configs = {
          container = {
            enable_character_fade = true
          },
          indent = {
            indent_size = 2,
            padding = 1, -- extra padding on left hand side
            -- indent guides
            with_markers = true,
            indent_marker = "│",
            last_indent_marker = "└",
            highlight = "NeoTreeIndentMarker",
            -- expander config, needed for nesting files
            with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "NeoTreeExpander",
          },
          icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "󰜌",
            -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
            -- then these will never be used.
            default = "*",
            highlight = "NeoTreeFileIcon"
          },
          modified = {
            symbol = "[+]",
            highlight = "NeoTreeModified",
          },
          name = {
            trailing_slash = false,
            use_git_status_colors = true,
            highlight = "NeoTreeFileName",
          },
          git_status = {
            symbols = {
              -- Change type
              added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
              modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
              deleted   = "✖", -- this can only be used in the git_status source
              renamed   = "󰁕", -- this can only be used in the git_status source
              -- Status type
              untracked = "",
              ignored   = "",
              unstaged  = "󰄱",
              staged    = "",
              conflict  = "",
            }
          },
        },
        -- A list of functions, each representing a global custom command
        -- that will be available in all sources (if not overridden in `opts[source_name].commands`)
        -- see `:h neo-tree-custom-commands-global`
        commands = {},
        window = {
          position = "float",
          width = 40,
          mapping_options = {
            noremap = true,
            nowait = true,
          },
          mappings = {
            ["<space>"] = {
              "toggle_node",
              nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
            },
            ["<2-LeftMouse>"] = "open",
            ["<cr>"] = "open",
            ["<esc>"] = "cancel", -- close preview or floating neo-tree window
            ["P"] = { "toggle_preview", config = { use_float = true }, },
            ["l"] = "focus_preview",
            ["S"] = "open_split",
            ["s"] = "open_vsplit",
            -- ["S"] = "split_with_window_picker",
            -- ["s"] = "vsplit_with_window_picker",
            ["t"] = "open_tabnew",
            -- ["<cr>"] = "open_drop",
            -- ["t"] = "open_tab_drop",
            ["w"] = "open_with_window_picker",
            --["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
            ["C"] = "close_node",
            -- ['C'] = 'close_all_subnodes',
            ["z"] = "close_all_nodes",
            --["Z"] = "expand_all_nodes",
            ["a"] = {
              "add",
              -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
              -- some commands may take optional config options, see `:h neo-tree-mappings` for details
              config = {
                show_path = "none" -- "none", "relative", "absolute"
              }
            },
            ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
            ["d"] = "delete",
            ["r"] = "rename",
            ["y"] = "copy_to_clipboard",
            ["x"] = "cut_to_clipboard",
            ["p"] = "paste_from_clipboard",
            ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
            -- ["c"] = {
            --  "copy",
            --  config = {
            --    show_path = "none" -- "none", "relative", "absolute"
            --  }
            --}
            ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
            ["q"] = "close_window",
            ["R"] = "refresh",
            ["?"] = "show_help",
            ["<"] = "prev_source",
            [">"] = "next_source",
          }
        },
        nesting_rules = {},
        filesystem = {
          filtered_items = {
            visible = true, -- when true, they will just be displayed differently than normal items
            hide_dotfiles = true,
            hide_gitignored = true,
            hide_hidden = true, -- only works on Windows for hidden files/directories
            hide_by_name = {
              --"node_modules"
              ".git"
            },
            hide_by_pattern = { -- uses glob style patterns
              --"*.meta",
              --"*/src/*/tsconfig.json",
              "*/.git/*"
            },
            always_show = { -- remains visible even if other settings would normally hide it
              --".gitignored",
            },
            never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
              --".DS_Store",
              --"thumbs.db"
            },
            never_show_by_pattern = { -- uses glob style patterns
              --".null-ls_*",
            },
          },
          follow_current_file = {
            enabled = false,                      -- This will find and focus the file in the active buffer every time
            --               -- the current file is changed while the tree is open.
            leave_dirs_open = false,              -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
          },
          group_empty_dirs = false,               -- when true, empty folders will be grouped together
          hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
          -- in whatever position is specified in window.position
          -- "open_current",  -- netrw disabled, opening a directory opens within the
          -- window like netrw would, regardless of window.position
          -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
          use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
          -- instead of relying on nvim autocmd events.
          window = {
            mappings = {
              ["<bs>"] = "navigate_up",
              ["."] = "set_root",
              ["H"] = "toggle_hidden",
              ["/"] = "fuzzy_finder",
              ["D"] = "fuzzy_finder_directory",
              ["#"] = "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
              -- ["D"] = "fuzzy_sorter_directory",
              ["f"] = "filter_on_submit",
              ["<c-x>"] = "clear_filter",
              ["[g"] = "prev_git_modified",
              ["]g"] = "next_git_modified",
            },
            fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
              ["<down>"] = "move_cursor_down",
              ["<C-n>"] = "move_cursor_down",
              ["<up>"] = "move_cursor_up",
              ["<C-p>"] = "move_cursor_up",
            },
          },

          commands = {} -- Add a custom command or override a global one using the same function name
        },
        buffers = {
          follow_current_file = {
            enabled = true,          -- This will find and focus the file in the active buffer every time
            --              -- the current file is changed while the tree is open.
            leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
          },
          group_empty_dirs = true,   -- when true, empty folders will be grouped together
          show_unloaded = true,
          window = {
            mappings = {
              ["bd"] = "buffer_delete",
              ["<bs>"] = "navigate_up",
              ["."] = "set_root",
            }
          },
        },
        git_status = {
          window = {
            position = "float",
            mappings = {
              ["A"]  = "git_add_all",
              ["gu"] = "git_unstage_file",
              ["ga"] = "git_add_file",
              ["gr"] = "git_revert_file",
              ["gc"] = "git_commit",
              ["gp"] = "git_push",
              ["gg"] = "git_commit_and_push",
            }
          }
        }
      })

      vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
    end
  }, -- DISABLE LATER
  --[[ {
    "xiyaowong/transparent.nvim",
    event = "VimEnter",
    enabled = false,
    config = function()
      require("transparent").setup({
        groups = { -- table: default groups
          'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
          'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
          'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
          'SignColumn', 'CursorLineNr', 'EndOfBuffer',
        },
        extra_groups = {
          "BufferLineTabClose",
          "BufferlineBufferSelected",
          "BufferLineFill",
          "BufferLineBackground",
          "BufferLineSeparator",
          "BufferLineIndicatorSelected",
        },                   -- table: additional groups that should be cleared
        exclude_groups = {}, -- table: groups you don't want to clear
      })
    end
  },  ]] {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    opts.tabline = nil -- remove tabline
    return opts
  end,
},
  --[[  {
    "tamago324/lir.nvim",
    event = "VimEnter",
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      local actions = require 'lir.actions'
      local mark_actions = require 'lir.mark.actions'
      local clipboard_actions = require 'lir.clipboard.actions'

      require('lir').setup({
        show_hidden_files = true,
        ignore = {},                -- { ".DS_Store", "node_modules" } etc.
        devicons = {
          enable = false,           --true,
          highlight_dirname = false --true
        },
        mappings = {
          ['<cr>']  = actions.edit,
          ['<C-s>'] = actions.split,
          ['<C-v>'] = actions.vsplit,
          ['<C-t>'] = actions.tabedit,

          ['<BS>']  = actions.up,
          ['<Esc>'] = actions.quit,

          ['K']     = actions.mkdir,
          ['N']     = actions.newfile,
          ['R']     = actions.rename,
          ['@']     = actions.cd,
          ['Y']     = actions.yank_path,
          ['.']     = actions.toggle_show_hidden,
          ['D']     = actions.delete,

          ['J']     = function()
            mark_actions.toggle_mark()
            vim.cmd('normal! j')
          end,
          ['C']     = clipboard_actions.copy,
          ['X']     = clipboard_actions.cut,
          ['P']     = clipboard_actions.paste,
        },
        float = {
          winblend = 0,
          curdir_window = {
            enable = false,
            highlight_dirname = false
          },

          -- -- You can define a function that returns a table to be passed as the third
          -- -- argument of nvim_open_win().
          -- win_opts = function()
          --   local width = math.floor(vim.o.columns * 0.8)
          --   local height = math.floor(vim.o.lines * 0.8)
          --   return {
          --     border = {
          --       "+", "─", "+", "│", "+", "─", "+", "│",
          --     },
          --     width = width,
          --     height = height,
          --     row = 1,
          --     col = math.floor((vim.o.columns - width) / 2),
          --   }
          -- end,
        },
        hide_cursor = true
      })
    end
  }, ]]
  --[[   {
    "nvim-telescope/telescope-file-browser.nvim",
    event = "VimEnter",
    config = function()
      require("telescope").setup({
        extensions = {
          file_browser = {
            theme = "dropdown",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
              ["i"] = {
                -- your custom insert mode mappings
              },
              ["n"] = {
                -- your custom normal mode mappings
              },
            },
          },
        },
      })


      require("telescope").load_extension "file_browser"
    end,
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }, ]]

  -- END

  {
    "smjonas/inc-rename.nvim",
    event = "VimEnter",
    config = function()
      require("inc_rename").setup({})
    end
  },
  { "m00qek/baleia.nvim" },
  {
    "samodostal/image.nvim",
    --  name = "image-previewer",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VimEnter",
    config = function()
      require("image").setup({
        render = {
          min_padding = 4,
          show_label = true,
          show_image_dimensions = true,
          use_dither = true,
          foreground_color = true,
          background_color = true
        },
        events = {
          update_on_nvim_resize = true,
        },
      })
    end
  }, --[[ {
  "CRAG666/code_runner.nvim",
  event = "VimEnter",
  config = function()
    require("code_runner").setup({
      filetype = {
        java = {
          "cd $dir &&",
          "javac $fileName &&",
          "java $fileNameWithoutExt"
        },
        python = "python3 -u",
        typescript = "pnpm dev",
        rust = {
          "cd $dir &&",
          "rustc $fileName &&",
          "$dir/$fileNameWithoutExt"
        },
      },
    });
  end
}, ]]
  { "ThePrimeagen/vim-be-good",         event = "VimEnter" },
  --[[  {
    "rktjmp/hotpot.nvim",
    name = "hotpot",
    event = "VimEnter",
    config = function()
      require("hotpot").setup({
        -- allows you to call `(require :fennel)`.
        -- recommended you enable this unless you have another fennel in your path.
        -- you can always call `(require :hotpot.fennel)`.
        provide_require_fennel = false,
        -- show fennel compiler results in when editing fennel files
        enable_hotpot_diagnostics = true,
        -- compiler options are passed directly to the fennel compiler, see
        -- fennels own documentation for details.
        compiler = {
          -- options passed to fennel.compile for modules, defaults to {}
          modules = {
            -- not default but recommended, align lua lines with fnl source
            -- for more debuggable errors, but less readable lua.
            -- correlate = true
          },
          -- options passed to fennel.compile for macros, defaults as shown
          macros = {
            env = "_COMPILER", -- MUST be set along with any other options
            -- you may wish to disable fennels macro-compiler sandbox in some cases,
            -- this allows access to tables like `vim` or `os` inside macro functions.
            -- See fennels own documentation for details on these options.
            -- compilerEnv = _G,
            -- allowGlobals = false,
          }
        }
      })
    end
  }, ]] --
  { 'weilbith/nvim-code-action-menu',   event = "VimEnter" },
  { "nyoom-engineering/oxocarbon.nvim", name = "oxocarbon", event = "VimEnter" },
  {
    "hrsh7th/nvim-cmp",
    name = "cmp",
    event = "VimEnter",
    config = function()
      local cmp = require('cmp');

      require("cmp").setup({
        preselect = cmp.PreselectMode.Item,
      })
    end
  },
  {
    "ray-x/lsp_signature.nvim",
    name = "lsp_signature",
    event = "VimEnter",
    config = function()
      require("lsp_signature").setup({

      })
    end
  }, {
  'rmagatti/goto-preview',
  event = "VimEnter",
  config = function()
    require('goto-preview').setup({
      width = 120,                                         -- Width of the floating window
      height = 15,                                         -- Height of the floating window
      border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" }, -- Border characters of the floating window
      default_mappings = true,                             -- Bind default mappings
      debug = false,                                       -- Print debug information
      opacity = nil,                                       -- 0-100 opacity level of the floating window where 100 is fully transparent.
      resizing_mappings = false,                           -- Binds arrow keys to resizing the floating window.
      post_open_hook = nil,                                -- A function taking two arguments, a buffer and a window to be ran as a hook.
      references = {                                       -- Configure the telescope UI for slowing the references cycling window.
        telescope = require("telescope.themes").get_dropdown({ hide_preview = false })
      },

      -- default keybinds
      -- nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>
      --nnoremap gpt <cmd>lua require('goto-preview').goto_preview_type_definition()<CR>
      --nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
      --nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>
      --nnoremap gpr <cmd>lua require('goto-preview').goto_preview_references()<CR>


      -- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
      focus_on_open = true,                                        -- Focus the floating window when opening it.
      dismiss_on_move = false,                                     -- Dismiss the floating window when moving the cursor.
      force_close = true,                                          -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
      bufhidden = "wipe",                                          -- the bufhidden option to set on the floating window. See :h bufhidden
      stack_floating_preview_windows = true,                       -- Whether to nest floating windows
      preview_window_title = { enable = true, position = "left" }, -- Whether to set the preview window title as the filename
    })
  end
}
}
