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
      local extension = vim.fn.expand("%:e");
      local filename = vim.fn.expand("%:t")
      local cmd = "";

      if extension == "ts" or extension == "tsx" or extension == "jsx" then
        cmd = "pnpm dev"
      elseif extension == "rs" then
        cmd = "cargo run"
      elseif extension == "cpp" then
        -- clang required (llvm)
        cmd = "clang++ " .. filename .. " -o main.exe && ./main.exe"
      elseif extension == "h" then
        local actualFile = string.sub(filename, 0, #filename - 2)
        cmd = "clang++ " ..
            actualFile .. ".cpp" ..
            " -o main.exe && ./main.exe"
      end

      pcall(vim.cmd, "FloatermSend " .. cmd)
      pcall(vim.cmd, "FloatermShow")
    end, { silent = true })

    -- vim.g.floaterm_shell = "shell"
    vim.g.floaterm_title = " Experience is the name everyone gives to their mistakes. "
    vim.g.floaterm_titleposition = "center"
  end,
}
