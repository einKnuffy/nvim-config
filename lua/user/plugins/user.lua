return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  --[[ {
    "rktjmp/hotpot.nvim",
    name = "hotpot",
    event = "VimEnter",
    --[[  config = function()
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
