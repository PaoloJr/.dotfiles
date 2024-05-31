# need to work on i3, polybar, picom, rofi and nerdfonts

#!/bin/bash

myrepo="$HOME/myrepo"
gitthings="$HOME/Downloads/gitthings"
scripts="$HOME/Downloads/gitthings/scripts"

#Installing Dependencies (arch only)
echo "Installing Dependencies"
# sudo pacman -S qtile rofi kdenlive obs-studio sxhkd xclip clipmenu krusader kio-extras discord kitty ranger dunst mpd ncmpcpp mpv 
neofetch qutebrowser pulsemixer zsh git neovim flatpak picom && paru -S nerd-fonts-complete feh ueberzug

#Download Dots
echo "Downloading Dotfiles"
cd && git clone 

mv my-dots myrepo

cd $myrepo
# ln -s $HOME/myrepo/qtile ~/.config
ln -s $HOME/myrepo/alacritty ~/.config
ln -s $HOME/myrepo/zsh ~/.config
# ln -s $HOME/myrepo/dunst ~/.config
# ln -s $HOME/myrepo/mpd ~/.config
# ln -s $HOME/myrepo/ncmpcpp ~/.config
# ln -s $HOME/myrepo/mpv ~/.config
#rm -r ~/.config/neofetch && ln -s $HOME/myrepo/neofetch ~/.config
ln -s $HOME/myrepo/picom ~/.config
# ln -s $HOME/myrepo/ranger ~/.config
# ln -s $HOME/myrepo/qutebrowser ~/.config
ln -s $HOME/myrepo/rofi ~/.config

cd $gitthings && git clone 
cd $scripts
sudo cp *.sh weather.py /usr/local/bin

cd $HOME/.config
git clone 
