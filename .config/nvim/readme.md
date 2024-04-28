# neovim readme
Notes and useful tips for my nvim usage and configuration.

## Future plans For Config
- keybind to turn spell check on and off (might not need this any more)
- keybind for wrap
- Set macros for indentation, full doc formatting, line commenting
- finish breaking up config

## Dependancies!!
Used in telescope for file finding among other things.
`sudo apt install fzf`

Some lsp's/linters may need node installed.
`sudo apt-get install node`

## Setting up Project Specific Settings
- put a `.exrc` file in your project root
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

## Note from Jumpstart Dev
- Lua Help:
- https://learnxinyminutes.com/docs/lua/

And then you can explore or search through `:help lua-guide`
- https://neovim.io/doc/user/lua-guide.html

#### Kickstart Guide:
I have left several `:help X` comments throughout the init.lua
You should run that command and read that help section for more information.

In addition, I have some `NOTE:` items throughout the file.
These are for you, the reader to help understand what is happening. Feel free to delete
them once you know what you're doing, but they should serve as a guide for when you
are first encountering a few different constructs in your nvim config.

I hope you enjoy your Neovim journey,
- TJ
