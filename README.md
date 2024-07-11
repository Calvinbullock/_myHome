# This repo holds the .files for my tmux, nvim, vim bashrc and more.

## Set Up.
Clone this repo into your home directory, then:

#### op 1 - install script
- run the install script in _myHome/shScripts/install.sh
- `chmod +x install.sh` - This will set install.sh to be executable
- `./install.sh`        - This will run the script
- **This script is only compatible with apt based distros**

#### op 2 - pick and choose
- Manuel sim-links what you like from:
    - vim
    - bashrc
    - zshrc
    - .config/...

- sym-link command: `ln -s target/location link/location`

#### op 3 - light install script
- a smaller lighter install script
- run the install script in _myHome/shScripts/light-install.sh
- `chmod +x light-install.sh` - This will set install.sh to be executable
- `./light-install.sh`        - This will run the script

---

## NeoVim
My neo vim config

I have changed a lot to make this more mine, but I started here in this order:
- Effective Neovim: Instant IDE         - [by TJ DeVries](https://www.youtube.com/watch?v=stqUbv-5u2s)
- The 0 to LSP : Neovim RC From Scratch - [by the ThePrimeagen](https://www.youtube.com/watch?v=w7i4amO_zaE&t=9s)
- NeoVim for noobs                      - [typeCraft](https://github.com/cpow/neovim-for-newbs/tree/main)

[Nvim release page](https://github.com/neovim/neovim/releases/)

[Nvim build page](https://github.com/neovim/neovim/blob/master/BUILD.md)

My [script](./shScripts/neovim.sh), to build nvim from source.

## Tmux
My tmux config is simple and light with vim like binds.

shmux - a session script by [typecrafts](https://github.com/typecraft-dev/shmux).

I have my own ordinal version [here](./shScripts/tmux-start.sh), but shmux is much more complete and usable. However mine server me well before for about 6 months until I found shmux.

## zshrc
A minimal zsh set up. 
- vi mode enabled, with bar vs block cursor for insert vs normal modes
- custom prompt with git statues (vanilla bash scripting)
- auto complete with vi keys navigation
- git branch and status in prompt

## Bashrc
This is where my custom bash prompt lives. It is based off of my-extravagant-zsh-prompt
after the redditer user linked below modified it for bash. I have made a lot of customizations
to fit my needs and likes.
- custom prompt with git statues 

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

## Sway WM - NOT DONE
- .config/
    - sway
    - waybar
    - wofi

