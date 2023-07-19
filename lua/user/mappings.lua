return {
  -- first key is the mode
  n = {
    --[[  ["<leader>b"] = false, ]]
    ["<leader>bb"] = false,
    ["<leader>bd"] = false,
    ["<leader>b\\"] = false,
    ["<leader>b|"] = false,

    -- Buffer
    -- ["<leader>b"] = { name = "Buffers" },
    -- REMOVE THE TABS ABOVE
    -- ["<tab>"] = { ":bnext!<cr>", desc = "Next Tab" },
    ["<tab>"] = { ":lua require('harpoon.ui').nav_next() <cr>" },
    ["<S-tab>"] = { ":lua require('harpoon.ui').nav_prev() <cr>" },
    --[[   ["<leader>to"] = { ":split term://bash <cr>", desc = "Open terminal in split view" },
    ["<leader>td"] = { ":bdelete! <cr>", desc = "Close (delete) terminal in split view" }, ]]
    ["<leader>d"] = { ":lua require'lir.float'.toggle() <cr>" },

    -- Git
    ["<leader>gc"] = { ":!git fetch <cr> :!git add * <cr> :!git commit -m main <cr> :!git push <cr> <cr>", desc =
    "Commit all (*) changes to (main branch)" },
    -- Aerial Toggle
    ["<leader>a"] = { ":AerialToggle <cr>", desc = "Toggle Aerial Window" },
    -- Code Action Menu Toggle
    ["<C-.>"] = { ':CodeActionMenu <cr>',
      desc = "Toggle Code Action Menu", },
    ["<leader>e"] = { name = "󱡀 Harpoon" },
    ["<leader>ee"] = { ':Telescope harpoon marks <cr>', desc = "Toggle Harpoon" },
    ["<leader>ea"] = { ':lua require("harpoon.mark").add_file() <cr>', desc = "Add marker to Harpoon" },
    ["<leader>et"] = {
      ':lua require("harpoon.term").gotoTerminal(1) <cr> i bash <cr> clear <cr>', desc =
    "Go to (Bash) Terminal" },
    ["<leader>ed"] = { ':lua require("harpoon.term").sendCommand(1, "pnpm dev") <cr>', desc =
    "Start pnpm dev server" }
    -- REMINDER:
    -- Ctrl + W + [h, l] = Switch splitted open files to left or right;
    -- gcc: line comment toggle; gbc: block comment toggle
  },
  --[[   i = {
    ["<C-e>"] = { "exit <cr> <cr> exit <cr> <cr>", desc = "Close terminal" }
  }, ]]
  t = {
    -- setting a mapping to false will disable it
    ["<C-e>"] = { "<cr> exit <cr>", desc = "Close terminal" }
    -- ["<esc>"] = false,
    -- ["<leader>td"] = { "exit <cr> <cr>", desc = "Close (delete) terminal in split view" },
  },
}
