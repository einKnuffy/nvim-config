let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <C-R> <Cmd>lua require("which-key").show("\18", {mode = "i", auto = true})
cnoremap <silent> <C-R> <Cmd>lua require("which-key").show("\18", {mode = "c", auto = true})
inoremap <silent> <C-S> :w 
cnoremap <silent> <Plug>(TelescopeFuzzyCommandSearch) e "lua require('telescope.builtin').command_history { default_text = [=[" . escape(getcmdline(), '"') . "]=] }"
inoremap <C-W> u
inoremap <C-U> u
nnoremap  <Cmd>nohlsearch|diffupdate|normal! 
vnoremap <silent>  :w 
nnoremap <silent>  :w 
nnoremap <silent> Þ <Nop>
nnoremap <silent>  <Cmd>lua require("which-key").show("\23", {mode = "n", auto = true})
tnoremap <silent>   :ToggleTerm 
xnoremap <silent>  Þ <Nop>
xnoremap <silent>   <Cmd>lua require("which-key").show(" ", {mode = "v", auto = true})
nnoremap <silent>  gÞ <Nop>
nnoremap <silent>  sÞ <Nop>
nnoremap <silent>  Þ <Nop>
snoremap <silent>   <Nop>
nnoremap <silent>   <Cmd>lua require("which-key").show(" ", {mode = "n", auto = true})
vnoremap <silent>  t :ToggleTerm  i
nnoremap <silent>  t :ToggleTerm  i
nnoremap <silent> !aÞ <Nop>
nnoremap <silent> !iÞ <Nop>
nnoremap <silent> !Þ <Nop>
nnoremap <silent> ! <Cmd>lua require("which-key").show("!", {mode = "n", auto = true})
xnoremap <silent> " <Cmd>lua require("which-key").show("\"", {mode = "v", auto = true})
nnoremap <silent> " <Cmd>lua require("which-key").show("\"", {mode = "n", auto = true})
xnoremap # y?\V"
omap <silent> % <Plug>(MatchitOperationForward)
xmap <silent> % <Plug>(MatchitVisualForward)
nmap <silent> % <Plug>(MatchitNormalForward)
nnoremap & :&&
nnoremap <silent> ' <Cmd>lua require("which-key").show("'", {mode = "n", auto = true})
xnoremap * y/\V"
nnoremap <silent> <aÞ <Nop>
nnoremap <silent> <iÞ <Nop>
nnoremap <silent> <Þ <Nop>
nnoremap <silent> < <Cmd>lua require("which-key").show("<", {mode = "n", auto = true})
nnoremap <silent> >aÞ <Nop>
nnoremap <silent> >iÞ <Nop>
nnoremap <silent> >Þ <Nop>
nnoremap <silent> > <Cmd>lua require("which-key").show(">", {mode = "n", auto = true})
nnoremap Y y$
xnoremap <silent> [Þ <Nop>
xnoremap <silent> [ <Cmd>lua require("which-key").show("[", {mode = "v", auto = true})
nnoremap <silent> [Þ <Nop>
nnoremap <silent> [ <Cmd>lua require("which-key").show("[", {mode = "n", auto = true})
omap <silent> [% <Plug>(MatchitOperationMultiBackward)
xmap <silent> [% <Plug>(MatchitVisualMultiBackward)
nmap <silent> [% <Plug>(MatchitNormalMultiBackward)
xnoremap <silent> ]Þ <Nop>
xnoremap <silent> ] <Cmd>lua require("which-key").show("]", {mode = "v", auto = true})
nnoremap <silent> ]Þ <Nop>
nnoremap <silent> ] <Cmd>lua require("which-key").show("]", {mode = "n", auto = true})
omap <silent> ]% <Plug>(MatchitOperationMultiForward)
xmap <silent> ]% <Plug>(MatchitVisualMultiForward)
nmap <silent> ]% <Plug>(MatchitNormalMultiForward)
nnoremap <silent> ` <Cmd>lua require("which-key").show("`", {mode = "n", auto = true})
xmap a% <Plug>(MatchitVisualTextObject)
nnoremap <silent> caÞ <Nop>
nnoremap <silent> ciÞ <Nop>
nnoremap <silent> cÞ <Nop>
nnoremap <silent> c <Cmd>lua require("which-key").show("c", {mode = "n", auto = true})
nnoremap <silent> daÞ <Nop>
nnoremap <silent> diÞ <Nop>
nnoremap <silent> dÞ <Nop>
nnoremap <silent> d <Cmd>lua require("which-key").show("d", {mode = "n", auto = true})
xnoremap <silent> gÞ <Nop>
xnoremap <silent> g <Cmd>lua require("which-key").show("g", {mode = "v", auto = true})
nnoremap <silent> guaÞ <Nop>
nnoremap <silent> guiÞ <Nop>
nnoremap <silent> guÞ <Nop>
nnoremap <silent> gUaÞ <Nop>
nnoremap <silent> gUiÞ <Nop>
nnoremap <silent> gUÞ <Nop>
nnoremap <silent> g~aÞ <Nop>
nnoremap <silent> g~iÞ <Nop>
nnoremap <silent> g~Þ <Nop>
nnoremap <silent> gÞ <Nop>
nnoremap <silent> g <Cmd>lua require("which-key").show("g", {mode = "n", auto = true})
xmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
omap <silent> g% <Plug>(MatchitOperationBackward)
xmap <silent> g% <Plug>(MatchitVisualBackward)
nmap <silent> g% <Plug>(MatchitNormalBackward)
xnoremap gb <Plug>(comment_toggle_blockwise_visual)
xnoremap gc <Plug>(comment_toggle_linewise_visual)
nnoremap gb <Plug>(comment_toggle_blockwise)
nnoremap gc <Plug>(comment_toggle_linewise)
nnoremap <silent> <expr> j v:count == 0 ? 'gj' : 'j'
nnoremap <silent> <expr> k v:count == 0 ? 'gk' : 'k'
nnoremap <silent> vaÞ <Nop>
nnoremap <silent> viÞ <Nop>
nnoremap <silent> vÞ <Nop>
nnoremap <silent> v <Cmd>lua require("which-key").show("v", {mode = "n", auto = true})
nnoremap <silent> yaÞ <Nop>
nnoremap <silent> yiÞ <Nop>
nnoremap <silent> yÞ <Nop>
nnoremap <silent> y <Cmd>lua require("which-key").show("y", {mode = "n", auto = true})
nnoremap <silent> zfaÞ <Nop>
nnoremap <silent> zfiÞ <Nop>
nnoremap <silent> zfÞ <Nop>
nnoremap <silent> zÞ <Nop>
nnoremap <silent> z <Cmd>lua require("which-key").show("z", {mode = "n", auto = true})
nnoremap <silent> <C-W>Þ <Nop>
nnoremap <silent> <C-W> <Cmd>lua require("which-key").show("\23", {mode = "n", auto = true})
vnoremap <silent> <C-S> :w 
nnoremap <silent> <C-S> :w 
xnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(netrw#GX(),netrw#CheckIfRemote(netrw#GX()))
xmap <silent> <Plug>(MatchitVisualTextObject) <Plug>(MatchitVisualMultiBackward)o<Plug>(MatchitVisualMultiForward)
onoremap <silent> <Plug>(MatchitOperationMultiForward) :call matchit#MultiMatch("W",  "o")
onoremap <silent> <Plug>(MatchitOperationMultiBackward) :call matchit#MultiMatch("bW", "o")
xnoremap <silent> <Plug>(MatchitVisualMultiForward) :call matchit#MultiMatch("W",  "n")m'gv``
xnoremap <silent> <Plug>(MatchitVisualMultiBackward) :call matchit#MultiMatch("bW", "n")m'gv``
nnoremap <silent> <Plug>(MatchitNormalMultiForward) :call matchit#MultiMatch("W",  "n")
nnoremap <silent> <Plug>(MatchitNormalMultiBackward) :call matchit#MultiMatch("bW", "n")
onoremap <silent> <Plug>(MatchitOperationBackward) :call matchit#Match_wrapper('',0,'o')
onoremap <silent> <Plug>(MatchitOperationForward) :call matchit#Match_wrapper('',1,'o')
xnoremap <silent> <Plug>(MatchitVisualBackward) :call matchit#Match_wrapper('',0,'v')m'gv``
xnoremap <silent> <Plug>(MatchitVisualForward) :call matchit#Match_wrapper('',1,'v'):if col("''") != col("$") | exe ":normal! m'" | endifgv``
nnoremap <silent> <Plug>(MatchitNormalBackward) :call matchit#Match_wrapper('',0,'n')
nnoremap <silent> <Plug>(MatchitNormalForward) :call matchit#Match_wrapper('',1,'n')
xnoremap <Plug>(comment_toggle_blockwise_visual) <Cmd>lua require("Comment.api").locked("toggle.blockwise")(vim.fn.visualmode())
xnoremap <Plug>(comment_toggle_linewise_visual) <Cmd>lua require("Comment.api").locked("toggle.linewise")(vim.fn.visualmode())
nnoremap <Plug>PlenaryTestFile :lua require('plenary.test_harness').test_directory(vim.fn.expand("%:p"))
nnoremap <C-L> <Cmd>nohlsearch|diffupdate|normal! 
inoremap <silent>  <Cmd>lua require("which-key").show("\18", {mode = "i", auto = true})
cnoremap <silent>  <Cmd>lua require("which-key").show("\18", {mode = "c", auto = true})
inoremap <silent>  :w 
inoremap  u
inoremap  u
let &cpo=s:cpo_save
unlet s:cpo_save
set clipboard=unnamedplus
set completeopt=menuone,noselect
set guifont=Hack\ Nerd\ Font\ Mono:h12
set helplang=de
set nohlsearch
set ignorecase
set noloadplugins
set mouse=a
set packpath=C:\\Program\ Files\\Neovim\\share\\nvim\\runtime
set runtimepath=~\\AppData\\Local\\nvim,~\\AppData\\Local\\nvim-data\\lazy\\lazy.nvim,~/AppData/Local/nvim-data/lazy/indent-blankline.nvim,~\\AppData\\Local\\nvim-data\\lazy\\neodev.nvim,~\\AppData\\Local\\nvim-data\\lazy\\fidget.nvim,~\\AppData\\Local\\nvim-data\\lazy\\mason-lspconfig.nvim,~\\AppData\\Local\\nvim-data\\lazy\\mason.nvim,~\\AppData\\Local\\nvim-data\\lazy\\nvim-lspconfig,~\\AppData\\Local\\nvim-data\\lazy\\friendly-snippets,~\\AppData\\Local\\nvim-data\\lazy\\cmp-nvim-lsp,~\\AppData\\Local\\nvim-data\\lazy\\cmp_luasnip,~\\AppData\\Local\\nvim-data\\lazy\\LuaSnip,~\\AppData\\Local\\nvim-data\\lazy\\nvim-cmp,~\\AppData\\Local\\nvim-data\\lazy\\Comment.nvim,~\\AppData\\Local\\nvim-data\\lazy\\vim-sleuth,~\\AppData\\Local\\nvim-data\\lazy\\lualine.nvim,~\\AppData\\Local\\nvim-data\\lazy\\plenary.nvim,~\\AppData\\Local\\nvim-data\\lazy\\telescope.nvim,~\\AppData\\Local\\nvim-data\\lazy\\toggleterm.nvim,~\\AppData\\Local\\nvim-data\\lazy\\which-key.nvim,~\\AppData\\Local\\nvim-data\\lazy\\vim-rhubarb,~\\AppData\\Local\\nvim-data\\lazy\\gitsigns.nvim,~\\AppData\\Local\\nvim-data\\lazy\\nvim-treesitter-textobjects,~\\AppData\\Local\\nvim-data\\lazy\\nvim-treesitter,~\\AppData\\Local\\nvim-data\\lazy\\vim-fugitive,~\\AppData\\Local\\nvim-data\\lazy\\oxocarbon.nvim,C:\\Program\ Files\\Neovim\\share\\nvim\\runtime,C:\\Program\ Files\\Neovim\\share\\nvim\\runtime\\pack\\dist\\opt\\matchit,C:\\Program\ Files\\Neovim\\lib\\nvim,~\\AppData\\Local\\nvim-data\\lazy\\readme,~\\AppData\\Local\\nvim-data\\lazy\\cmp-nvim-lsp\\after,~\\AppData\\Local\\nvim-data\\lazy\\cmp_luasnip\\after
set smartcase
set statusline=%#Normal#
set termguicolors
set timeoutlen=300
set undofile
set updatetime=250
set window=54
" vim: set ft=vim :
