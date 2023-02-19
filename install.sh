#!/bin/bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p ~/.config/nvim/
curl -sLo ~/.config/nvim/init.vim https://raw.githubusercontent.com/ES-Yukun/neovim-vscode-themes/main/init.vim
