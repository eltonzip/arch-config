#!/bin/env bash

sudo pacman -S --needed xorg-xwayland sway wmenu swaylock swaync alacritty grim flameshot        \
	obs-studio pavucontrol firefox krita libreoffice-fresh xdg-desktop-portal-wlr                \
	zathura zathura-djvu zathura-pdf-mupdf imv noto-fonts-cjk noto-fonts-extra noto-fonts-emoji  \
	ntfs-3g ranger mpv bluez pipewire-audio pipewire-pulse polkit

mkdir -p $HOME/.config/
ln -s $(pwd)/sway/ $HOME/.config/sway
ln -s $(pwd)/alacritty/ $HOME/.config/alacritty
ln -s $(pwd)/zathura/ $HOME/.config/zathura
ln -s $(pwd)/flameshot/ $HOME/.config/flameshot
ln -s $(pwd)/ranger/ $HOME/.config/ranger

sed -i '$a\
\
export MOZ_ENABLE_WAYLAND=1\
alias Sway="dbus-run-session sway"' $HOME/.bashrc

sudo systemctl --user enable --now pipewire-pulse.service
