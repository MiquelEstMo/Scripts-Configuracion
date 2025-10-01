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

echo -e "${RED}__________       .__              ________  _______________   ____${NC}"
echo -e "${YELLOW}\____    /  _____|  |__           \______ \ \_   _____/\   \ /   /${NC}"
echo -e "${GREEN}  /     /  /  ___/  |  \   ______  |    |  \ |    __)_  \   Y   / ${NC}"
echo -e "${CYAN} /     /_  \___ \|   Y  \ /_____/  |    \`   \|        \  \     /  ${NC}"
echo -e "${MAGENTA}/_______ \/____  >___|  /         /_______  /_______  /   \___/   ${NC}"
echo -e "${BLUE}        \/     \/     \/                  \/        \/            ${NC}"
echo
echo -e "${CYAN}=======================================================${NC}"
echo -e "${YELLOW}            Instal·lador Zsh && Oh My Zsh${NC}"
echo -e "${CYAN}=======================================================${NC}"

echo -e "\n${MAGENTA}✨ Instalant Zsh && Oh My Zsh${NC}"

# ------------------------ BANNER ------------------------

# --------- ACTUALITZACIÓ DE PAQUETS ---------

echo -e "${BLUE}⏳ Actualitzant paquets locals...${NC}\n"

sudo apt-get update
sudo apt-get upgrade -y

echo -e "\n${GREEN}✅ Paquets actualitzats amb èxit.${NC}"

# --------- ACTUALITZACIÓ DE PAQUETS ---------

# -------------------------- INSTALACIÓ DE ZSH --------------------------

echo -e "\n${MAGENTA}✨ Instalant Zsh...${NC}"
sudo apt install zsh -y
zsh --version

echo -e "${GREEN}✅ Zsh instalat correctament!${NC}"

echo -e "\n${MAGENTA}✨ Instal·lant Oh My Zsh...${NC}"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo -e "\n${MAGENTA}✨ Instal·lant plugins...${NC}"

git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/Pilaton/OhMyZsh-full-autoupdate.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/OhMyZsh-full-autoupdate
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use


echo -e "\n${MAGENTA}✨ Instal·lant configuració...${NC}"

cp -v .zshrc ~/.zshrc
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc    

echo -e "${GREEN}✅ Configuració instalada correctament!${NC}"

echo -e "${GREEN}✅ Oh My Zsh instalat correctament!${NC}"

chsh -s $(which zsh)

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Kitty Terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'gnome-terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Ctrl><Alt>t'

echo -e "${GREEN}✅ Zsh && Oh My Zsh s'han instal·lat correctament!!${NC}"
echo -e "${YELLOW}🚀 Reinicia la terminal per aplicar els canvis.${NC}"
echo -e "${YELLOW}💡 Recorda configurar la font JetBrainsMono Nerd Font a la teva terminal!${NC}"