# This repo hold the .files for my tmux, nvim, vim and bashrc

## Set Up.
Clone this repo into where ever you like, I prefer the home directory.

Then you need to sim-link
* .config/nvim      - link should be in you .config dir
* .config/alacritty - link should be in you .config dir
* .tmux.conf        - link should be in your home dir
* .bashrc           - link should be in your home dir
* .vim              - link should be in your home dir

sym-link command:
$ ln -s target/location link/location

## my_nvim
My neo vim config

My litle trip into trying neo vim as my main code edditer.

My starting point was:

- The 0 to LSP : Neovim RC From Scratch - by the ThePrimeagen
https://www.youtube.com/watch?v=w7i4amO_zaE&t=9s
- Effective Neovim: Instant IDE - by TJ DeVries
https://www.youtube.com/watch?v=stqUbv-5u2s
- NeoVim for noobs
https://github.com/cpow/neovim-for-newbs/tree/main

Everything under lua dir is from neovim for noobs and not curently in use.

## Vim
A very basic set up that I don't use much anymore.
- no plugins
- no themes
- mostly use NeoVim

## BashRC

#### Prompt_bash:
This is where my custom bash prompt lives. It is based off of my-extravagant-zsh-prompt
after the redditer user linked below modifyed it for bash. I have made a lot of customizations
to fit my needs and likes.

Taken from a reddit post that forked it from stevelosh.
- Source - https://www.reddit.com/r/commandline/comments/zt6x9/what_are_your_favorite_custom_prompts/
- Source - http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/

#### Alias
-Just a file containing all my aliaes for easy back up

## Alacritty
-My terminal try out, config was borrowed from:
https://gitlab.com/dwt1/dotfiles

