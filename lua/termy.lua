return {
  'voldikss/vim-floaterm',
  name = "floaterm",
  config = function()
    -- vim.o.shell = '"C:/Program Files/Git/bin/bash.exe"'
    -- vim.o.shellcmdflag = '-c'
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

    -- vim.g.floaterm_shell = "C:/Program\\ Files/Git/bin/sh.exe"
    vim.g.floaterm_title = " Experience is the name everyone gives to their mistakes. "
    vim.g.floaterm_titleposition = "center"

    -- vim.g.shell = 'bash.exe'
    -- vim.g.shellcmdflag = '-c'
    -- vim.g.shellredir = '>%s 2>&1'
    -- vim.g.shellquote= shellxescape=
    -- vim.g.noshelltemp
    -- vim.g.shellxquote=
    -- vim.g.shellpipe='2>&1| tee'
  end,
}
