My vim config
=============

I do all of my work in the latest possible version of Vim. I usually run Vim
inside tmux, with which I interact via semi-transparent, 256-color, unicode
xterm. Many of my settings, including color settings, reflect this. I prefer tabs to buffers, and there is much integration with git.

How to use
---------

    git clone <this repo> ~/.vim
    mv ~/.vimrc ~/.vimrc.bak
    ln -s ~/.vim/vimrc ~/.vimrc

Caveats
-------

I think my vimrc is ready to use as-is for most people, but there are a few gotchas that have annoyed my pair-programming parners:

1: I use the movement-variant of `~`, so if you want to change case on a single character you'll need to cursor over it and do something like `~l`

2: I have a pretty long status line; when it doesn't fit into the width of your terminal, it causes vim to throw random "Press ENTER" messages.

