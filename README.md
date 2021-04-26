My vim config
=============

I do all of my work in the latest possible version of Vim.
I usually run Vim inside tmux, itself run in alacritty.
My Alacritty config is in my [dotfiles repo](https://github.com/igor47/dotfiles).

How to use
---------

To install the repo:

    git clone <this repo> ~/repos/
    pushd ~ && ln -s ~/reps/vimrc .vim && ln -s ~/.vim/vimrc ~/.vimrc && popd

Then, open vim and run `PlugInstall`.

To use fzf to open files with ctrl-p (for files in git) and ctrl-o (files in the filesystem), you'll need to have fzf installed.

Caveats
-------

I think my vimrc is ready to use as-is for most people, but there are a few gotchas that have annoyed my pair-programming parners:

1: I use the movement-variant of `~`, so if you want to change case on a single character you'll need to cursor over it and do something like `~l`

2: I have a pretty long status line; when it doesn't fit into the width of your terminal, it causes vim to throw random "Press ENTER" messages.

