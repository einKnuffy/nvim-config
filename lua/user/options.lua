-- set vim options here (vim.<first_key>.<second_key> = value)
return {
  opt = {
    -- set to true or false etc.
    relativenumber = false, -- sets vim.opt.relativenumber
    number = true,          -- sets vim.opt.number
    spell = false,          -- sets vim.opt.spell
    signcolumn = "auto",    -- sets vim.opt.signcolumn to auto
    wrap = false,           -- sets vim.opt.wrap
    guifont = "Hack Nerd Font Mono:h12",
    showtabline = 0
  },
  g = {
    mapleader = " ",                 -- sets vim.g.mapleader
    autoformat_enabled = true,       -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    cmp_enabled = true,              -- enable completion at start
    autopairs_enabled = true,        -- enable autopairs at start
    diagnostics_mode = 3,            -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
    icons_enabled = true,            -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
    ui_notifications_enabled = true, -- disable notifications when toggling UI elements
    resession_enabled = false,       -- enable experimental resession.nvim session management (will be default in AstroNvim v4)
  },
}
--
-- If you need more control, you can use the function()...end notation
-- return function(local_vim)
--   local_vim.opt.relativenumber = true
--   local_vim.g.mapleader = " "
--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
--
--   return local_vim
-- end
--
--return function(local_vim)
-- local keymap = vim.api.nvim_set_keymap
--local opts = { noremap = true };

--local_vim.opt.relativenumber = false;
--local_vim.opt.number = true;
--local_vim.opt.guifont = "Hack Nerd Font Mono:h12";

--  vim.api.nvim_command('SOMECOMMAND')
-- vim.api.nvim_command("<leader>e");
-- vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<leader>Sl', true, true, true), 'n', true);
-- local termcodes = vim.api.nvim_replace_termcodes('<Space>', true, true, true);
-- vim.api.nvim_feedkeys(termcodes, 'n', true);

-- termcodes = vim.api.nvim_replace_termcodes('e', true, true, true);
-- vim.api.nvim_feedkeys(termcodes, 'n', true);

--[[ local prettier = require("prettier")

  prettier.setup({
    bin = 'prettierd', -- or `'prettierd'` (v0.23.3+)
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
    cli_options = {
      arrow_parens = "always",
      bracket_spacing = true,
      bracket_same_line = false,
      embedded_language_formatting = "auto",
      end_of_line = "lf",
      html_whitespace_sensitivity = "css",
      -- jsx_bracket_same_line = false,
      jsx_single_quote = false,
      print_width = 80,
      prose_wrap = "preserve",
      quote_props = "as-needed",
      semi = true,
      single_attribute_per_line = false,
      single_quote = true,
      tab_width = 2,
      trailing_comma = "es5",
      use_tabs = false,
      vue_indent_script_and_style = false,
    },
  }) ]]
--

--  return local_vim;
--end
