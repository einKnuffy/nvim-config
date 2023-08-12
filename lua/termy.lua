return {
  'voldikss/vim-floaterm',
  name = "floaterm",
  config = function()
    --    pcall(vim.cmd, "filetype on")

    vim.keymap.set({ "i", "n", "t" }, "<C-t>", function()
      pcall(vim.cmd, "FloatermToggle")
    end, { silent = true })

    vim.keymap.set({ "t" }, "<C-q>", function()
      pcall(vim.cmd, "FloatermSend clear")
    end)

    -- needs existing terminal.. and will execute only current file
    vim.keymap.set({ "i", "n" }, "<C-e>", function()
      local extension = vim.bo.ft;
      local cmd = "";

      if extension == "typescript" or extension == "typescriptreact" or extension == "javascriptreact" then
        cmd = "pnpm dev"
      elseif extension == "rust" then
        cmd = "cargo run"
      elseif extension == "cpp" then
        -- clang required (llvm)
        cmd = "clang++ " .. vim.fn.expand("%:t") .. " -o main.exe && ./main.exe"
      else
        return
      end

      pcall(vim.cmd, "FloatermSend " .. cmd)
      pcall(vim.cmd, "FloatermShow")
    end, { silent = true })

    vim.g.floaterm_shell = "bash"
    vim.g.floaterm_title = " Experience is the name everyone gives to their mistakes. "
    vim.g.floaterm_titleposition = "center"
  end,
}
