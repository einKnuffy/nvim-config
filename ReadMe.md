

#  Personal nvim configuration - einknuffy

## Steps

- Have Neovim-QT on Windows installed (won't be used as a GUI)
- Have Cygwin-Terminal installed (Linux-like environment on windows)
  - Install in the installation process the package `tmux`
- Set the cygwin font to `Hack Nerd Font` with size 12
- Set the cygwin theme to `Monokai Dimmed` and cursor type to `line`
- Install my tmux configuration in cygwin-terminal
- Install nvim configuration
- Follow prerequisites and requirements to install dependencies

> **Use nvim inside cygwin with tmux to do programming projects under cygwin custom folders:   `%CYGWIN INSTALLATION PATH%\dev\ ...`**

## ToDo

- Implement a script like (.bat) for automatically installing all dependencies like the languages...
- Make this config compelte and for Neovim make it an IDE

## REMINDERS

- C++ Cheating Tutorial: [UnknownCheats](https://www.unknowncheats.me/forum/c-and-c-/113642-useful-gamehacking-programming-threads-mega-thread.html)
- Cheat Engine Pointers: [CE](https://www.unknowncheats.me/forum/programming-for-beginners/110375-cheat-engine-finding-base-address-pointer-scan.html)
- SoT: [TUTORIALS](https://www.unknowncheats.me/forum/sea-of-thieves/436708-sea-thieves-complete-hack-tool-list.html)
- [Useful Nvim Package List]([https://github.com/catppuccin/nvim#Integrations](https://github.com/rockerBOO/awesome-neovim))

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

Let's now have some fun coding! 😅😀
