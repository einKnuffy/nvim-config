#  Personal nvim configuration - einknuffy

## Steps
- Have Neovim-QT on Windows installed (won't be used as a GUI)
- Have Cygwin-Terminal installed (Linux-like environment on windows)
  - Install in the installation process the package `tmux`
- Set the cygwin font to `Hack Nerd Font` with size 12
- Set the cygwin theme to `Monokai Dimmed` and cursor type to `line`
- Install my tmux configuration `.tmux.conf` in `~`, and [tpm](https://github.com/tmux-plugins/tpm?tab=readme-ov-file#installation)) in Cygwin-Terminal:
```bash
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
# set -g @plugin 'einKnuffy/tmux-electricity'

# Configuration for the powerline plugin
# set -g @tmux_power_theme '#af87ff'
# set -g @tmux_power_show_upload_speed true
# set -g @tmux_power_show_download_speed true
# set -g @tmux_power_show_web_reachable true
# set -g @tmux_power_prefix_highlight_pos 'LR'

# Fix 2
set-window-option -g pane-border-status bottom
set-window-option -g pane-border-format '' #'#{pane_current_path}'

# Fix
set -g base-index 1
setw -g pane-base-index 1

# Escape Fix
set -sg escape-time 50
set -g mouse on

# Key bindings for selecting windows
bind -n F1 select-window -t 1
bind -n F2 select-window -t 2
bind -n F3 select-window -t 3
bind -n F4 select-window -t 4
bind -n F5 select-window -t 5
bind -n F6 select-window -t 6
bind -n F7 select-window -t 7
bind -n F8 select-window -t 8
bind -n F9 select-window -t 9

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
```

- Install nvim configuration
- Follow prerequisites and requirements to install dependencies

> **Use nvim inside cygwin with tmux to do programming projects under cygwin custom folders:   `%CYGWIN INSTALLATION PATH%\dev\ ...`**

## ToDo

- Implement a script like (.bat) for automatically installing all dependencies like the languages...
- Make this config complete and for Neovim make it an IDE (with debugger, testing, ...)
- Have a look at [this](https://github.com/rockerBOO/awesome-neovim?tab=readme-ov-file#game), [this too](https://github.com/piersolenski/wtf.nvim), [also this](https://github.com/kevinhwang91/nvim-ufo)

## Links as a reminder

- C++ Cheating Tutorial: [UnknownCheats](https://www.unknowncheats.me/forum/c-and-c-/113642-useful-gamehacking-programming-threads-mega-thread.html)
- Cheat Engine Pointers: [CE](https://www.unknowncheats.me/forum/programming-for-beginners/110375-cheat-engine-finding-base-address-pointer-scan.html)
- SoT: [TUTORIALS](https://www.unknowncheats.me/forum/sea-of-thieves/436708-sea-thieves-complete-hack-tool-list.html)
- [Useful Nvim Package List](https://github.com/rockerBOO/awesome-neovim)

### Dependencies

- Rust, Luarocks, Python, LLVM (Clang compiler)

> Is this yet needed?
- Ascii-Image-Converter: [GitHub](https://github.com/TheZoraiz/ascii-image-converter#windows)
  - Add the path to its folder in user env variables.

> Deprecated
### Aftermath

- Install all mason packages needed, such as:
  ```txt
  clang-format
  clangd
  json-lsp
  lua-language-server
  markdownltnt
  marksman
  prettter
  prettierd
  python-lsp-server
  rust-analyzer
  svelte-language-server
  ts-standard
  typescript-language-server
  ```

### I guess that's it!

Easiest replacing by "programming" it yourself:

- `%s/color\.r/color.r()/g` for replacing `color.r` with `color.r()`

That is it...
