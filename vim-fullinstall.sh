#!/bin/bash
echo -e "\nInstalant NeoVim && NvChad"


# --------- ACTUALITZACIÓ DE PAQUETS ---------

echo -e "Actualitzant paquets locals...\n"

sudo apt-get update
sudo apt-get upgrade

echo -e "\nPaquets actualitzats amb éxit."

# --------- ACTUALITZACIÓ DE PAQUETS ---------

# -------------------------- INSTALACIÓ DE NEOVIM --------------------------

echo -e "\nInstalant NeoVim..."

mkdir -p ~/Applications1
cd ~/Applications1

wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.appimage
chmod +x nvim-linux-x86_64.appimage
sudo ln -s ~/Applications/nvim-linux-x86_64.appimage /usr/local/bin/nvim

nvim --version

echo "NeoVim instalat correctament!"

# -------------------------- INSTALACIÓ DE NEOVIM --------------------------
