
This is Scott's VIM configuration for Vim 8
===========================================

### Included packages:
 * [The NERD Tree](https://github.com/scrooloose/nerdtree)
 * [Vim-Airline](https://github.com/vim-airline/vim-airline)
 
And, a custom [.vimrc](./vimrc).



To obliterate an existing vim config and replace with Scott's:
==============================================================

    cd && rm -rf .vimrc .vim && \
    git clone git://github.com/scott-r-lindsey/scott-vim8.git .vim && \
    ln -s .vim/vimrc .vimrc && \
    cd .vim && git submodule init && git submodule update && cd


