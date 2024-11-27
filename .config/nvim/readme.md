# neovim readme
Notes and useful tips for my nvim usage and configuration.

## Future plans For Config
- fix comment highlights with split

## Dependancies!!
Used in telescope for file finding among other things.
- `sudo apt install fzf` - if on Debian based linux
- `sudo apt install ripgrep` - if on Debian based Linux

Some lsp's/linters may need node installed.
- `sudo apt-get install node` - if on Debian based Linux

## Setting up Project Specific Settings
- put a `.exrc` file in your project root
    - **USE WITH CAUTION** I have it off by default
    - a `.exrc` file is written in vim script
    - ex `setlocal shiftwidth=3`

- language specifics
    - use `after/ftplugin` this will load ftpugins after the other configs.
    - make a file in after/ftplugin named after the file extension you are setting up
        - EX: "textfile", "cpp". "html"

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

## Cool Keybinds
- `z=` --- this will use built in spell correction
- `ctrl + x + f` for file path completion in vim (default)
- `shift + v + j` this will remove newlines and bring that content onto the line your cursor is on
- folds
    - `zc` collapse a fold
    - `zo` open a fold
    ```lua
    -- fold settings I use
    vim.o.foldmethod = 'expr'
    vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
    vim.o.foldlevelstart = 99
    ```
- `sift + <>` will indent or outdent (chain-able with nums)
- `ctrl q` - when using a telescope fzf find you can `ctrl q` to move it to a jump list in a buffer split

#### I use this for live serving html/css/js
`python3 -m http.server`

## Note from kickstart Dev
- Lua Help:
- https://learnxinyminutes.com/docs/lua/

And then you can explore or search through `:help lua-guide`
- https://neovim.io/doc/user/lua-guide.html

