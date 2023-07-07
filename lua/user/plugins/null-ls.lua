return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      -- null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.formatting.prettier,
      --
      --[[    null_ls.builtins.formatting.prettier.with({
        extra_args = function(params)
          return params.options
              and {
                "--tab-width 4",
                "--single-quote true",
                "--use-tabs true"
              }
        end,
      }), ]]

      null_ls.builtins.formatting.prettierd.with({
        --[[    arrow_parens = "always",
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
        vue_indent_script_and_style = false, ]]
        env = {
          PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("C:/Users/kjell/AppData/Local/nvim/.prettierrc.json"),
        },
      }),
    }
    return config -- return final config table
  end,
}
