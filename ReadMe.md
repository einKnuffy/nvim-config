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

```
Use nvim inside cygwin with tmux to do programming projects under cygwin custom folders:
`%CYGWIN INSTALLATION PATH%\dev\ ...` <-- new path for programming projects
```

## ToDo

- Implement a script like (.bat) for automatically installing all dependencies like the languages...

- MAKE A COMPLETE IDE (MINIMAL BUT AN IDE), including DEBUGGER and TESTS

## REMINDERS

- C++ Cheating Tutorial: [UnknownCheats](https://www.unknowncheats.me/forum/c-and-c-/113642-useful-gamehacking-programming-threads-mega-thread.html)

- Cheat Engine Pointers: [CE](https://www.unknowncheats.me/forum/programming-for-beginners/110375-cheat-engine-finding-base-address-pointer-scan.html)

- SoT: [TUTORIALS](https://www.unknowncheats.me/forum/sea-of-thieves/436708-sea-thieves-complete-hack-tool-list.html)


- [Useful Nvim Packages](https://github.com/catppuccin/nvim#Integrations)
## Let's get started

![lets-get-started-rh01o6](https://github.com/einKnuffy/radon/assets/66639485/2823c10e-2d8e-4e4c-ab82-861963129b84)

### Needed before being able to run Neovim

- Zig, Rust, Luarocks, Python, LLVM (Clang compiler) 

- Ascii-Image-Converter: [GitHub](https://github.com/TheZoraiz/ascii-image-converter#windows)

  - Add the path to its folder in user env variables.

- Git Bash

  - Add the path to /bin folder to user env variables.

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
