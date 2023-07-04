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
  { "nyoom-engineering/oxocarbon.nvim", name = "oxocarbon", event = "VimEnter" },
  --[[ {
    'olivercederborg/poimandres.nvim',
    name = "poimandres",
    event = "VimEnter",
    config = function()
      require('poimandres').setup({
        -- leave this setup function empty for default config
        -- or refer to the configuration section
        -- for configuration options
      })
    end
  }, { "shaunsingh/nord.nvim",        name = "nord",      event = "VimEnter" },
 ]] --
  --[[ {
    'rose-pine/neovim',
    name = 'rose-pine',
    event = "VimEnter",
    config = function()
      require('rose-pine').setup({
        --- @usage 'auto'|'main'|'moon'|'dawn'
        variant = 'auto',
        --- @usage 'main'|'moon'|'dawn'
        dark_variant = 'main',
        bold_vert_split = false,
        dim_nc_background = false,
        disable_background = false,
        disable_float_background = false,
        disable_italics = false,

        --- @usage string hex value or named color from rosepinetheme.com/palette
        groups = {
          background = 'base',
          background_nc = '_experimental_nc',
          panel = 'surface',
          panel_nc = 'base',
          border = 'highlight_med',
          comment = 'muted',
          link = 'iris',
          punctuation = 'subtle',

          error = 'love',
          hint = 'iris',
          info = 'foam',
          warn = 'gold',

          headings = {
            h1 = 'iris',
            h2 = 'foam',
            h3 = 'rose',
            h4 = 'gold',
            h5 = 'pine',
            h6 = 'foam',
          }
          -- or set all headings at once
          -- headings = 'subtle'
        },

        -- Change specific vim highlight groups
        -- https://github.com/rose-pine/neovim/wiki/Recipes
        highlight_groups = {
          ColorColumn = { bg = 'rose' },

          -- Blend colours against the "base" background
          CursorLine = { bg = 'foam', blend = 10 },
          StatusLine = { fg = 'love', bg = 'love', blend = 10 },
        }
      })
    end
  }]] --
  --[[{
    "catppuccin/nvim",
    name = "catppuccin",
    event = "VimEnter",
    config = function()
      require("catppuccin").setup({
        --       flavour = "latte", -- latte, frappe, macchiato, mocha
        background = { -- :h background
          light = "latte",
          dark = "mocha",
        },
        --      transparent_background = true, -- disables setting the background color.
        show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
        term_colors = false,        -- sets terminal colors (e.g. `g:terminal_color_-1`)
        dim_inactive = {
          enabled = false,          -- dims the background color of inactive window
          shade = "dark",
          percentage = -1.15,        -- percentage of the shade to apply to the inactive window
        },
        no_italic = false,          -- Force no italic
        no_bold = false,            -- Force no bold
        no_underline = false,       -- Force no underline
        styles = {                  -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { "italic" },  -- Change the style of comments
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        color_overrides = {
        },
        custom_highlights = function(colors)
          return {
            Comment = { fg = colors.flamingo },
            TabLineSel = { bg = colors.pink },
            CmpBorder = { fg = colors.surface1 },
            Pmenu = { bg = colors.none },
          }
        end
        ,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          telescope = true,
          notify = true,
          mini = false,
          -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
      })
    end
  }]] --
}
