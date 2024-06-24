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

## lsp/linters of choice
- clangd        (c++, c)
- shellcheck    (bash)
- omnisharp     (C#)
- webdev **(need node.js / npm||pnpm)**
    - typescript-language-server tsserver (keywords: typescript, javascript)
    - emmet-ls      (HTMl)
    - css-lsp
- go
    - gopls
    - golangci-lint
- pythons
    - mypy
    - jedi-language-server

## Note from kickstart Dev
- Lua Help:
- https://learnxinyminutes.com/docs/lua/

And then you can explore or search through `:help lua-guide`
- https://neovim.io/doc/user/lua-guide.html

### I use this for live serving html/css/js
`python3 -m http.server`
