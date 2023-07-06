# Personal nvim configuration

## Let's get started

### Needed before being able to run Neovim

- C/C++ Compiler, Rust Installed: [C/C++ Compiler](https://www.freecodecamp.org/news/how-to-install-c-and-cpp-compiler-on-windows/); [Rust](https://www.rust-lang.org/)

- Ascii-Image-Converter: [GitHub](https://github.com/TheZoraiz/ascii-image-converter#windows)

  - Add the path to its folder in user env variables.

- Git Bash
  - Add the path to /bin folder to user env variables.
  - That's it

### Then install all remaining ts... and mason packages

- Do this on second nvim run with this cmdline run code:

```sh
nvim -c "MasonUninstallAll" -c "MasonInstall eslint-lsp eslint_d json-lsp jsonld-lsp jsonlint lua-language-server markdown-toc marksman markdownlint prettier prettierd rust-analyzer stylelint stylelint-lsp tailwindcss-language-server ts-standard typescript-language-server" -c "TSInstall javascript tsx jsx typescript lua rust" -c "MasonUpdateAll" -c "!echo 'When everything is done.... you can now close nvim with :q (maybe 3x times)'"
```
