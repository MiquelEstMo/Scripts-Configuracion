#!/bin/bash

# --------- COLORS ---------

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# --------- COLORS ---------

# ------------------------ BANNER ------------------------

echo -e "${RED}____   ____.___   _____    ________  _______________   ____${NC}"
echo -e "${YELLOW}\   \ /   /|   | /     \   \______ \ \_   _____/\   \ /   /${NC}"
echo -e "${GREEN} \   Y   / |   |/  \ /  \   |    |  \ |    __)_  \   Y   / ${NC}"
echo -e "${CYAN}  \     /  |   /    Y    \  |    \`   \|        \  \     /  ${NC}"
echo -e "${MAGENTA}   \___/   |___\____|__  / /_______  /_______  /   \___/   ${NC}"
echo -e "${BLUE}                       \/          \/        \/            ${NC}"
echo
echo -e "${CYAN}=======================================================${NC}"
echo -e "${YELLOW}         Instal·lador de NeoVim & NvChad${NC}"
echo -e "${CYAN}=======================================================${NC}"

echo -e "\n${MAGENTA}✨ Instalant NeoVim && NvChad${NC}"

# ------------------------ BANNER ------------------------

# --------- ACTUALITZACIÓ DE PAQUETS ---------

echo -e "${BLUE}⏳ Actualitzant paquets locals...${NC}\n"

sudo apt-get update
sudo apt-get upgrade -y

echo -e "\n${GREEN}✅ Paquets actualitzats amb éxit.${NC}"

# --------- ACTUALITZACIÓ DE PAQUETS ---------

# -------------------------- INSTALACIÓ DE NEOVIM --------------------------

echo -e "\n${MAGENTA}✨ Instalant NeoVim...${NC}"

mkdir -p ~/Applications
cd ~/Applications
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.appimage
chmod +x nvim-linux-x86_64.appimage
sudo rm -f /usr/local/bin/nvim 
sudo ln -s ~/Applications/nvim-linux-x86_64.appimage /usr/local/bin/nvim
nvim --version

echo -e "${GREEN}✅ NeoVim instalat correctament!${NC}"

# -------------------------- INSTALACIÓ DE NEOVIM --------------------------

# -------------------------- INSTALACIÓ DE NVCHAD --------------------------

echo -e "${MAGENTA}✨ Instalant NvChad...${NC}"

git clone https://github.com/NvChad/starter ~/.config/nvim

echo -e "${GREEN}✅ NvChad instalat correctament!${NC}"

# -------------------------- INSTALACIÓ DE NVCHAD --------------------------

echo -e "${GREEN}✅ NeoVim && NvChad s'han instal·lat correctament!!${NC}"
echo -e "${YELLOW}🚀 Executa NeoVim amb 'nvim' per configurar tot.${NC}"