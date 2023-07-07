return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  --[[  {
    "Dhanus3133/LeetBuddy.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("leetbuddy").setup({})
    end,
    keys = {
      { "<leader>cq", "<cmd>LBQuestions<cr>", desc = "List Questions" },
      { "<leader>cl", "<cmd>LBQuestion<cr>",  desc = "View Question" },
      { "<leader>cr", "<cmd>LBReset<cr>",     desc = "Reset Code" },
      { "<leader>ct", "<cmd>LBTest<cr>",      desc = "Run Code" },
      { "<leader>cs", "<cmd>LBSubmit<cr>",    desc = "Submit Code" },
    },
  }, ]]
  --[[  {
    "MunifTanjim/prettier.nvim",
    event = "VimEnter",
    config = function()
      require("prettier").setup({
        bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
        filetypes = {
          "css",
          "graphql",
          "html",
          "javascript",
          "javascriptreact",
          "json",
          "less",
          "markdown",
          "scss",
          "typescript",
          "typescriptreact",
          "yaml",
        },

        -- cli_options = {
        arrow_parens = "always",
        bracket_spacing = true,
        bracket_same_line = true,
        embedded_language_formatting = "auto",
        end_of_line = "lf",
        html_whitespace_sensitivity = "css",
        -- jsx_bracket_same_line = false,
        jsx_single_quote = true,
        print_width = 80,
        prose_wrap = "preserve",
        quote_props = "as-needed",
        semi = true,
        single_attribute_per_line = false,
        single_quote = true,
        tab_width = 4,
        trailing_comma = "es5",
        use_tabs = true,
        vue_indent_script_and_style = false,
        --  },
      })
    end
  }, ]]
  {
    'neoclide/coc.nvim',
    event = "VimEnter",
    config = function()

    end
  },
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
  }, {
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
},
  { "ThePrimeagen/vim-be-good", },
  --[[   {
    "andweeb/presence.nvim",
    -- event = "AstroFile",
    name = "presence",
    config = function()
      require("presence").setup({
        -- General options
        auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
        neovim_image_text   = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
        main_image          = "neovim",                   -- Main image display (either "neovim" or "file")
        client_id           = "793271441293967371",       -- Use your own Discord application client id (not recommended)
        log_level           = "debug",                    -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
        debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
        enable_line_number  = false,                      -- Displays the current line number instead of the current project
        blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
        buttons             = true,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
        file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
        show_time           = true,                       -- Show the timer

        -- Rich Presence text options
        editing_text        = "Editing %s",         -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
        file_explorer_text  = "Browsing %s",        -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
        git_commit_text     = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
        plugin_manager_text = "Managing plugins",   -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
        reading_text        = "Reading %s",         -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
        workspace_text      = "Working on %s",      -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
        line_number_text    = "Line %s out of %s",  -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
      });
    end
  }, ]]
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
    event = "InsertEnter",
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
