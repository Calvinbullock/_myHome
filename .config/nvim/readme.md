# neovim readme
Notes and useful tips for my nvim usage and configuration.

## Future plans For Config
- keybind for wrap
- Set permenent macros for indentation
- set a comment highlight for question?

## Dependancies!!
Used in telescope for file finding among other things.
`sudo apt install fzf` - if on debian based linux

Some lsp's/linters may need node installed.
`sudo apt-get install node` - if on debian based linux

## Setting up Project Specific Settings
- put a `.exrc` file in your project root
    - **USE WITH CAUTION** off by defualt 
    - a `.exrc` file is written in vim script
    - ex `setlocal shiftwidth=3`

- language specifics
    - use `after/ftplugin` this will load ftpugins after the other configs.

## lsp/linters of choice
- clangd                (c++, c)
- bash-language-server  (bash)
- omnisharp             (C#)

- go-lang
    - gopls
    - golangci-lint

- pythons
    - mypy
    - jedi-language-server

- webdev *(need node.js / npm||pnpm)*
    - typescript-language-server tsserver (keywords: typescript, javascript)
    - emmet-ls          (HTMl snippets)
    - css-lsp

## Less Used Keybinds
- `ctrl + x + f` for file path completion in vim (default)

### I use this for live serving html/css/js
`python3 -m http.server`

## Note from kickstart Dev
- Lua Help:
- https://learnxinyminutes.com/docs/lua/

And then you can explore or search through `:help lua-guide`
- https://neovim.io/doc/user/lua-guide.html

