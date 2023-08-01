return {
  'voldikss/vim-floaterm',
  name = "floaterm",
  config = function()
    vim.keymap.set({ "i", "n", "t" }, "<C-t>", function()
      pcall(vim.cmd, "FloatermToggle")
    end, { silent = true })

    vim.g.floaterm_shell = "bash"
    vim.g.floaterm_title = " Experience is the name everyone gives to their mistakes. "
    vim.g.floaterm_titleposition = "center"
  end,
}
