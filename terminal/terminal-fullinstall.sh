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

sudo dnf upgrade -y

echo -e "\n${GREEN}✅ Paquets actualitzats amb èxit.${NC}"

# --------- ACTUALITZACIÓ DE PAQUETS --------

echo -e "\n${MAGENTA}✨ Instalant Kitty...${NC}"
sudo dnf install kitty -y

echo -e "${GREEN}✅ Kitty instalat correctament!${NC}"


# -------------------------- INSTALACIÓ DE ZSH --------------------------

echo -e "\n${MAGENTA}✨ Instalant Zsh...${NC}"
sudo dnf install zsh -y
zsh --version

echo -e "${GREEN}✅ Zsh instalat correctament!${NC}"

echo -e "\n${MAGENTA}✨ Instalant Starship...${NC}"

sudo dnf install starship -y
cp -f "$(dirname "$0")/configs/starship.toml" ~/.config/starship.toml

echo -e "${GREEN}✅ Starship instalat correctament!${NC}"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo -e "\n${MAGENTA}✨ Instal·lant plugins...${NC}"

git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/Pilaton/OhMyZsh-full-autoupdate.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/OhMyZsh-full-autoupdate
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use


echo -e "\n${MAGENTA}✨ Instal·lant configuració...${NC}"

cp -v "$(dirname "$0")/.zshrc" ~/.zshrc

echo -e "${GREEN}✅ Configuració instalada correctament!${NC}"

sudo dnf install starship -y

echo -e "${GREEN}✅ Oh My Zsh instalat correctament!${NC}"

chsh -s $(which zsh)

echo -e "${GREEN}✅ Zsh, Kitty && Oh My Zsh s'han instal·lat correctament!!${NC}"
echo -e "\n${YELLOW}⚠️  Es reiniciarà el sistema en 10 segons${NC}"
sleep 10
sudo reboot