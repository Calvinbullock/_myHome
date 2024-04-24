# neovim readme
Some lsp's/linters may need node instaled
`sudo apt-get install node`

## lsp/linters of choice
- clangd        (c++, c)
- emmet-ls      (html, css)
- shellcheck    (bash)
- omnisharp     (C#)
- go
    - gopls
    - golangci-lint
- pythons
    - mypy
    - jedi-language-server

## Note from Jumpstart Dev
- Lua Help:
- https://learnxinyminutes.com/docs/lua/

And then you can explore or search through `:help lua-guide`
- https://neovim.io/doc/user/lua-guide.html

### Kickstart Guide:
I have left several `:help X` comments throughout the init.lua
You should run that command and read that help section for more information.

In addition, I have some `NOTE:` items throughout the file.
These are for you, the reader to help understand what is happening. Feel free to delete
them once you know what you're doing, but they should serve as a guide for when you
are first encountering a few different constructs in your nvim config.

I hope you enjoy your Neovim journey,
- TJ

### Setting up Project Specific Settings
- put a `.exrc` file in your project root
    - a `.exrc` file is written in vim script
    - ex `setlocal shiftwidth=3`
