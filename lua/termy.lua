return {
  'voldikss/vim-floaterm',
  name = "floaterm",
  config = function()
    --    pcall(vim.cmd, "filetype on")

    vim.keymap.set({ "i", "n", "t" }, "<C-t>", function()
      pcall(vim.cmd, "FloatermToggle")
    end, { silent = true })

    -- Please delete all buffer before switching
    vim.keymap.set({ "i", "n", "t" }, "<C-e>", function()
      --[[   pcall(vim.cmd, "FloatermShow")
      -- redo last terminal operation
      -- pcall(vim.cmd, "execute 'normal <C-n> <C-p>'")
      vim.api.nvim_feedkeys(vim.api.nvim_eval('"\\<Up>"'), 'i', true)

      pcall(vim.cmd, "FloatermHide") ]]

      --[[     local extension = vim.cmd("buffers") --vim.bo.ft; --expand("%:e")
      local cmd = "";                      --expand("%:e")


      if (string.find(extension, ".ts") or string.find(extension, ".tsx") or string.find(extension, ".jsx")) then
        cmd = "pnpm dev"
      elseif (string.find(extension, ".rs")) then
        cmd = "cargo run"
      else
        return
      end

      print("Full cmd: " .. cmd)

      pcall(vim.cmd, "FloatermSend " .. cmd) ]]
    end, { silent = true })

    vim.g.floaterm_shell = "bash"
    vim.g.floaterm_title = " Experience is the name everyone gives to their mistakes. "
    vim.g.floaterm_titleposition = "center"
  end,
}
