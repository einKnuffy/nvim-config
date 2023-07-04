-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    -- ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    -- ["<leader>bD"] = {
    --  function()
    --     require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) require("astronvim.utils.buffer").close(bufnr) end)
    --   end,
    --    desc = "Pick to close",
    --  },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- ["<l-shift><tab>"] = { ":bprev!<cr>", desc = "Prev Tab" },
    ["<tab>"] = { ":bnext!<cr>", desc = "Next Tab" },
    ["<leader>t"] = { name = "Terminal" },
    ["<leader>to"] = { ":vsplit term://bash <cr>", desc = "Open tab" },
    ["<leader>gc"] = { ":!git fetch <cr> :!git add * <cr> :!git commit -m main <cr> :!git push <cr>", desc =
    "Commit all (*) changes to (main branch)" }
    -- REMINDER:
    -- Ctrl + W + [h, l] = Switch splitted open files to left or right;
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
