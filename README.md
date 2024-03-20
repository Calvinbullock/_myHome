# This repo holds the .files for my tmux, nvim, vim and bashrc

## Set Up.
Clone this repo into your desired directory, I prefer the home directory, then:

#### op 1
- run the install script in shScripts/install.sh -- **not tested yet**

#### op 2
- Manuel sim-links
    * .config/nvim      - link should be in your .config dir
    * .config/alacritty - link should be in your .config dir
    * .config/ranger    - link should be in your .config dir
    * .tmux.conf        - link should be in your home dir
    * .bashrc           - link should be in your home dir
    * .vimrc            - link should be in your home dir
    * .zshrc            - link should be in your home dir

sym-link command:
$ ln -s target/location link/location

## NeoVim
My neo vim config

I have changed a lot to make this more mine, but I started here:
- Effective Neovim: Instant IDE - [by TJ DeVries](https://www.youtube.com/watch?v=stqUbv-5u2s)
- The 0 to LSP : Neovim RC From Scratch - [by the ThePrimeagen](https://www.youtube.com/watch?v=w7i4amO_zaE&t=9s)
- NeoVim for noobs [typeScript](https://github.com/cpow/neovim-for-newbs/tree/main)
    - Everything under lua dir is from neovim for noobs and not curently in use.

## Vim
A very basic set up that I don't use much anymore.
- no plugins
- custom prompt with git statues 

## zshrc
A minimal zsh set up. 
- vi mode enabled, with bar vs block cursor for insert vs normal modes
- custom prompt with git statues (vanilla bash scripting)
- auto complete with vi keys navigation

## Bashrc
This is where my custom bash prompt lives. It is based off of my-extravagant-zsh-prompt
after the redditer user linked below modifyed it for bash. I have made a lot of customizations
to fit my needs and likes.

My prompt was taken from a reddit post that forked a zsh prompt from stevelosh, the redditer converted it to bash.
- [reddit post](https://www.reddit.com/r/commandline/comments/zt6x9/what_are_your_favorite_custom_prompts/)
- [og zsh prompt repo](http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/)

## Aliases.sh
This is a file that both my bash and zsh source.

Notable alias
- git
    - `gc` - `git commit`
    - `ga` - `git add`
    - `gd` - `git diff `
    - `gps` - `git push`
    - `gpl` - `git pull`
    - `gst` - `git status`
    - `gco` - `git checkout`

- Tmux
    - `tmuxrc` - `~/.tmux.conf`
    - `tso` - `tmux sourc e-file ~/.tmux.conf`
    - `ta` - `tmux a -t`
    - `ts` - `tmux switch -t`
    - `tl` - `tmux ls`
    - `tk` - `tmux kill-session -t`
    - `tm` - ` tmux new -s`

## Alacritty
-My terminal try out, config was borrowed from:
[DTs github dotfiles](https://gitlab.com/dwt1/dotfiles)

## Ranger
A terminal based file manager, with movement based on vim motions.

