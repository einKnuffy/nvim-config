return {
  -- first key is the mode
  n = {
    -- Buffer
    -- ["<leader>b"] = { name = "Buffers" },
    ["<tab>"] = { ":bnext!<cr>", desc = "Next Tab" },
    ["<leader>c"] = { name = "Competitive Coding" },
    ["<leader>to"] = { ":split term://bash <cr>", desc = "Open terminal in split view" },
    ["<leader>td"] = { ":bdelete! <cr>", desc = "Close (delete) terminal in split view" },
    -- Git
    ["<leader>gc"] = { ":!git fetch <cr> :!git add * <cr> :!git commit -m main <cr> :!git push <cr> <cr>", desc =
    "Commit all (*) changes to (main branch)" },
    -- Aerial Toggle
    ["<leader>a"] = { ":AerialToggle <cr>", desc = "Toggle Aerial Window" },
    -- Code Action Menu Toggle
    ["<leader>i"] = { ':CodeActionMenu <cr>',
      desc = "Toggle Code Action Menu", }
    -- REMINDER:
    -- Ctrl + W + [h, l] = Switch splitted open files to left or right;
    -- gcc: line comment toggle; gbc: block comment toggle
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
    -- ["<leader>td"] = { "exit <cr> <cr>", desc = "Close (delete) terminal in split view" },
  },
}
