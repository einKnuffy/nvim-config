vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Lazy check for updates
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn
      .system { 'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git', '--branch=stable', -- latest stable release
        lazypath }
end
vim.opt.rtp:prepend(lazypath)

-- ToDo: Just run fetch and pull (checkout main to this repo) to get newest updates, and if any of them "fail" then just say that the user needs to stash all changes he locally made...
vim.api.nvim_create_user_command("UpdateConfig", function()
  print("This will remove all local changes, and sync local config to lastest, online.")
  print(vim.fn.system("git stash && git branch main && git fetch && git pull && git checkout"))
end, {})

require('lazy').setup({ -- NOTE: First, some plugins that don't require any configuration
  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb', -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',  -- NOTE: This is where your plugins related to LSP can be installed.
  {
    'neovim/nvim-lspconfig',
    dependencies = { -- Automatically install LSPs to stdpath for neovim
      {
        'williamboman/mason.nvim',
        config = true
      }, 'williamboman/mason-lspconfig.nvim', -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      {
        'j-hui/fidget.nvim',
        tag = 'legacy',
        opts = {}
      }, -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim' }
  },

  -- Enabling customized plugins
  require("nvimtreesitter"),
  require("statusline"),
  require('autoformat'),
  require("dap-debug"),

  -- Git signs next to line number
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = {
          text = ''
        },
        change = {
          text = ''
        },
        delete = {
          text = ''
        },
        topdelete = {
          text = "󰃆" -- or 󱒼
        },
        changedelete = {
          text = '󰷭'
        }
      },
    }
  },

  -- Disabling Vimspector (DEBUGGER) due to having nvim-dap
  --[[ {
    'puremourning/vimspector',
    name = "vimspector",
    event = "VimEnter"
   }, ]]

  -- Enabling Snippets
  {
    'hrsh7th/nvim-cmp',
    dependencies = {                                  -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip', -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',                         -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets', 'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline', "hrsh7th/cmp-nvim-lsp-signature-help", "uga-rosa/cmp-dictionary" }
  },

  -- Hardtime adapting best practices
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {}
  },

  -- Enabling an indentation blankline for better visual
  {
    'lukas-reineke/indent-blankline.nvim',
    event = "VeryLazy",
    config = function()
      require("ibl").setup({
        indent = {
          char = '┊',
          -- show_trailing_blankline_indent = false
        }
      })
    end
  },

  -- Enablign a Translator
  {
    "potamides/pantran.nvim",
    config = function()
      local pantran = require("pantran")

      vim.keymap.set("n", "<C-t>", pantran.motion_translate, { noremap = true, silent = true, expr = true })
      vim.keymap.set("v", "<C-t>", pantran.motion_translate, { noremap = true, silent = true, expr = true })
      -- vim.keymap.set("n", "<leader>trr", function() return pantran.motion_translate() .. "_" end,
      -- { noremap = true, silent = true, expr = true })
      -- vim.keymap.set("x", "<leader>tr", pantran.motion_translate, { noremap = true, silent = true, expr = true })
    end
  },

  -- Games
  --[[ {
    'jim-fx/sudoku.nvim',
    cmd = "Sudoku",
    config = function()
      require("sudoku").setup({
        -- configuration ...
      })
    end
  }, ]]

  -- Enabling Comment modification
  {
    'numToStr/Comment.nvim',
    config = function(self)
      require("Comment").setup({
        padding = true,
        sticky = true,
        toggler = {
          line = 'gg',
          block = 'gb',
        },
        opleader = {
          line = 'gc',
          block = 'gb',
        },
        ---LHS of extra mappings
        extra = {
          above = 'gcO',
          below = 'gco',
          eol = 'gcA',
        },
        mappings = {
          basic = true,
          extra = true,
        },
      })
    end
  },

  -- Nvim Autopairs
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
  },

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    -- branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },


  -- Hover functionality
  {
    "lewis6991/hover.nvim",
    config = function()
      require("hover").setup {
        init = function()
          -- Require providers
          require("hover.providers.lsp")
          require('hover.providers.gh')
          require('hover.providers.gh_user')
        end,
        preview_opts = {
          border = nil
        },
        preview_window = false,
        title = true
      }

      -- Setup keymaps
      --      vim.keymap.set({ "n", "i" }, "<C-d>", require("hover").hover_select, { desc = "hover.nvim (select)" })
    end
  },

  -- Discord integration
  {
    'einKnuffy/betterpresence.nvim',
    config = function()
      require("presence").setup({
        -- General options
        auto_update = true,
        neovim_image_text = "It's neovim fr",
        main_image = "programming-1",
        client_id = "992075159097843753", -- CUSTOM ID
        log_level = "warn",
        debounce_timeout = 10,
        enable_line_number = true,
        blacklist = {},
        buttons = true,
        file_assets = {},
        show_time = true,

        -- Rich Presence text options
        editing_text = "Editing %s",
        file_explorer_text = "Browsing %s",
        git_commit_text = "Committing changes",
        plugin_manager_text = "Managing plugins",
        reading_text = "Reading %s",
        workspace_text = "Working on %s",
        line_number_text = "Line %s out of %s",
      })
    end
  },

  -- Code Action Menu with Quickfixes
  {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
  },

  -- Quick Marked Buffer Switcher
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")

      -- REQUIRED
      harpoon:setup({})
      -- REQUIRED

      vim.keymap.set("n", "<C-a>", function() harpoon:list():append() end)
      vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

      vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
      vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
      vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
      vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
      vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
    end
  },

  -- Codeium Disabled For now
  --[[ {
    'Exafunction/codeium.vim',
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
  }, ]] --

  -- Taking Notes disabled
  --[[ {
    'JellyApple102/flote.nvim',
    config = function()
      require('flote').setup({
        q_to_quit = true,
        window_style = 'minimal',
        window_border = 'solid',
        window_title = true,
        notes_dir = vim.fn.getenv("appdata"), --vim.fn.getenv("temp"),
        files = {
          global = 'flote-global.md',
          cwd = function()
            return vim.fn.getcwd()
          end,
          file_name = function(cwd)
            local base_name = vim.fs.basename(cwd)
            local parent_base_name = vim.fs.basename(vim.fs.dirname(cwd))
            return parent_base_name .. '_' .. base_name .. '.md'
          end
        }
      })
    end
  }, ]]


  -- WakaTime integration
  { 'wakatime/vim-wakatime' },

  -- Github editing and reviewing disabled
  --[[  {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require "octo".setup()
    end
  }, ]]

  -- GLSL Syntax Support
  --[[ { 'tikhomirov/vim-glsl' },  ]] -- for glsl (vert, frag shader) highlighting (semantic is more complex)

  -- LeetBuddy integration (coding in Neovim)
  {
    "Dhanus3133/LeetBuddy.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    event = "VimEnter",
    config = function()
      require("leetbuddy").setup({
        language = "ts", -- change default language
      })
    end,
    keys = {
      { "<leader>lq", "<cmd>LBQuestions<cr>", desc = "List Questions" },
      { "<leader>ll", "<cmd>LBQuestion<cr>",  desc = "View Question" },
      { "<leader>lr", "<cmd>LBReset<cr>",     desc = "Reset Code" },
      { "<leader>lt", "<cmd>LBTest<cr>",      desc = "Run Code" },
      { "<leader>ls", "<cmd>LBSubmit<cr>",    desc = "Submit Code" },
    },
  },

  -- Color preview
  {
    'brenoprata10/nvim-highlight-colors',
    event = "VeryLazy",
    config = function()
      require('nvim-highlight-colors').setup({
        enable_tailwind = true,
        render = "background" --"first_column" --"background"
      })
    end
  },

  -- Cursor line highlighter
  'danilamihailov/beacon.nvim',

  -- Virtual Text support
  {
    "theHamsta/nvim-dap-virtual-text",
    opts = {},
  },

  -- Theme (customized by myself)
  {
    'nyoom-engineering/oxocarbon.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'oxocarbon'
      local oxocarbon = require("oxocarbon.colorutils")

      vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#ffffff", bg = nil })
      vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = oxocarbon.base02, bg = oxocarbon.base02 })
      vim.api.nvim_set_hl(0, "TelescopePromptNormal", { fg = oxocarbon.base05, bg = oxocarbon.base02 })
      vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { fg = oxocarbon.base08, bg = oxocarbon.base02 })
      vim.api.nvim_set_hl(0, "TelescopeNormal", { fg = oxocarbon.none, bg = oxocarbon.blend })
      vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = oxocarbon.base02, bg = oxocarbon.base12 })
      vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = oxocarbon.base02, bg = oxocarbon.base11 })
      vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = oxocarbon.blend, bg = oxocarbon.blend })
      vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = oxocarbon.none, bg = oxocarbon.base02 })
      vim.api.nvim_set_hl(0, "TelescopePreviewLine", { fg = oxocarbon.none, bg = oxocarbon.base01 })
      vim.api.nvim_set_hl(0, "TelescopeMatching",
        { fg = oxocarbon.base08, bg = oxocarbon.none, bold = true, italic = true })
      vim.api.nvim_set_hl(0, "MsgArea",
        { fg = "#ffffff", bg = nil })
      vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#ffffff", bg = nil })
      vim.api.nvim_set_hl(0, "FloatermBorder", { fg = "#ffffff", bg = nil })
      vim.api.nvim_set_hl(0, "Pmenu", { bg = "#ffffff", fg = "#efefef" })
      vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#efefef" })

      local secondary = "#909090"

      vim.api.nvim_set_hl(0, "Comment", { fg = secondary })
      vim.api.nvim_set_hl(0, "LineNr", { fg = secondary })
      vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = secondary })
      vim.api.nvim_set_hl(0, "VertSplit", { fg = "#ffffff", bg = nil })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = nil })

      pcall(vim.cmd, "set noruler")
      pcall(vim.cmd, "set laststatus=3")
    end
  },

  -- Enabling Transparency
  {
    "xiyaowong/transparent.nvim",
    config = function()
      local transparent = require("transparent")
      transparent.setup({ -- Optional, you don't have to run setup.
        groups = {        -- table: default groups
          'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
          'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
          'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
          'SignColumn', 'CursorLineNr', 'EndOfBuffer',
        },
        extra_groups = {},   -- table: additional groups that should be cleared
        exclude_groups = {}, -- table: groups you don't want to clear
      })
    end
  }
})

-- [[ Setting options ]]

-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

vim.o.foldmethod = "manual" --"indent"
vim.o.foldexpr = "nvim_treesitter#foldindent()"
-- vim.cmd("autocmd FileType markdown setlocal foldmethod=manual")

-- [[ Custom Keybinds ]]

-- Save buffer
vim.keymap.set({ "n", "i" }, "<C-s>", function() pcall(vim.cmd, "write") end, { silent = true })

-- Automcompletion Keybinds Reminder
-- C-n = Select next item
-- C-p = Select prev item
-- C-d = Scroll docs up
-- C-f = Scroll docs down
-- Tab or S-Tab for selecting next/prev item

-- Fuzzy finder
vim.keymap.set({ "n", "i" }, "<C-f>", function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    previewer = false -- maybe true
  })
end, { silent = true })

-- Go to definition
vim.keymap.set({ "n", "i" }, '<C-g>', vim.lsp.buf.definition, { silent = true })

-- Diagnostics
-- ToDo: Use something better
vim.keymap.set({ "n", "i" }, "<C-d>", require('telescope.builtin').diagnostics, { silent = true })

-- Code Action Fix
vim.keymap.set({ "n", "i" }, "<C-c>", "<cmd>CodeActionMenu<cr>", { silent = true })

-- Hover Menu with LSP Information
vim.keymap.set({ "n", "i" }, "<C-k>", require("hover").hover, { silent = true })

-- Next buffer switch
-- vim.keymap.set({ "n", "i" }, "<C-Tab>", "<cmd>bnext<cr>", { silent = true })

-- Delete buffer
vim.keymap.set("n", "q", "<cmd>bd<cr>", { silent = true })

-- rename
--[[ vim.keymap.set({ "n", "i" }, "<C-r>", ":IncRename ") ]]

-- ADDITIONAL (DO NOT CHANGE)
-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', {
  silent = true
})

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", {
  expr = true,
  silent = true
})
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", {
  expr = true,
  silent = true
})

-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', {
  clear = true
})
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*'
})

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false
      }
    }
  }
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
--[[ vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, {
  desc = '[?] Find recently opened files'
})
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, {
  desc = '[ ] Find existing buffers'
})
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false
  })
end, {
  desc = '[/] Fuzzily search in current buffer'
})

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, {
  desc = 'Search [G]it [F]iles'
})
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, {
  desc = '[S]earch [F]iles'
})
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, {
  desc = '[S]earch [H]elp'
})
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, {
  desc = '[S]earch current [W]ord'
})
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, {
  desc = '[S]earch by [G]rep'
})
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, {
  desc = '[S]earch [D]iagnostics'
}) ]]

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup({
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'lua', 'python', 'rust', 'tsx', 'typescript', 'vimdoc', 'vim', "svelte", "json", "cpp" },

  -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
  auto_install = true,

  highlight = {
    enable = true
  },
  indent = {
    -- enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<M-space>'
    }
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner'
      }
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer'
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer'
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer'
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer'
      }
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner'
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner'
      }
    }
  }
});

-- Diagnostic keymaps
--[[ vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {
  desc = 'Go to previous diagnostic message'
})
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {
  desc = 'Go to next diagnostic message'
})
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {
  desc = 'Open floating diagnostic message'
})
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, {
  desc = 'Open diagnostics list'
}) ]]

-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
--[[ local on_attach = function(_, bufnr) ]]
-- NOTE: Remember that lua is a real programming language, and as such it is possible
-- to define small helper and utility functions so you don't have to repeat yourself
-- many times.
--
-- In this case, we create a function that lets us more easily define mappings specific
-- for LSP related items. It sets the mode, buffer and description for us each time.

--[[   nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, {
    desc = 'Format current buffer with LSP'
  }) ]]
--[[ end ]]

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.

-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
  --[[  window = {
    documentation = cmp.config.window.bordered({
      border = 'rounded',
      scrollbar = false,
    }),
    completion = cmp.config.window.bordered({
      border = 'rounded',
      scrollbar = false,
    }),
  }, ]]
  window = {
    completion = { -- rounded border; thin-style scrollbar
      border = 'rounded',
      scrollbar = false,
      winhighlight = 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None',
      -- scrollbar = '║',
    },
    documentation = { -- no border; native-style scrollbar
      border = 'rounded',
      scrollbar = false,
      winhighlight = 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None',
      -- winhighlight = "CmpMenu"
      -- other options
      --[[ documentation = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      }, ]]
    },
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    },
    --[[   ['<Down>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<Up>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }) ]]
    --[[ ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }) ]] --
  },
  sources = { {
    name = 'nvim_lsp'
  }, {
    name = 'luasnip'
  }, { name = 'buffer' }, { name = 'nvim_lsp_signature_help' }, {
    name = "dictionary",
    keyword_length = 2,
  }, }
}

local dict = require("cmp_dictionary")

dict.setup({
  -- The following are default values.
  exact_length = 2,
  first_case_insensitive = false,
  document = false,
  document_command = "wn %s -over",
  sqlite = false,
  max_number_items = -1,
  capacity = 5,
  debug = false,
})

cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Set custom highlight group for nvim-cmp menu
-- vim.cmd([[highlight CmpMenu guibg=#1d1f21 guifg=#c5c8c6]])

-- Set border for the menu
-- vim.cmd([[set pumblend=20]]) -- Set transparency for popup menu
-- vim.cmd([[highlight Pmenu guibg=#161616 guifg=#262626]])
-- vim.cmd([[highlight PmenuSel guibg=#2d2d2d]])
-- vim.cmd([[highlight PmenuSbar guibg=#1d1f21 guifg=#373b41]])
-- vim.cmd([[highlight PmenuThumb guibg=#707880 guifg=#1d1f21]])

-- Set borders for the menu
-- vim.cmd([[highlight PmenuBorder guifg=#ffffff guibg=#1d1f21]])
-- vim.cmd([[set pmbc=]]) -- popup menu border color



local servers = {
  clangd = {},
  -- gopls = {},
  -- pyright = {},
  rust_analyzer = {},
  tsserver = {},
  svelte = {},
  marksman = {},
  pylsp = {},
  jsonls = {},
  lua_ls = {
    Lua = {
      workspace = {
        checkThirdParty = false
      },
      telemetry = {
        enable = false
      }
    }
  }
}
-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers)
}

mason_lspconfig.setup_handlers { function(server_name)
  require('lspconfig')[server_name].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = servers[server_name]
  }
end }

-- Load start screen
require "startup-screen"

vim.o.autoindent = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.cmd("set cmdheight=2") -- customizing bottom padding
vim.cmd("set fillchars=fold:\\ ,vert:\\│,eob:\\ ,msgsep:‾")
vim.cmd("set number")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
