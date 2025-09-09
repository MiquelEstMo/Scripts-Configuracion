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
echo -e "${RED}_____                                       .__     ${NC}"
echo -e "${YELLOW}  /  _  \ ______ ______  ______           _____|  |__  ${NC}"
echo -e "${GREEN} /  /_\  \\____ \\____ \/  ___/  ______  /  ___/  |  \ ${NC}"
echo -e "${CYAN}/    |    \  |_> >  |_> >___ \  /_____/  \___ \|   Y  \\${NC}"
echo -e "${MAGENTA}\____|__  /   __/|   __/____  >         /____  >___|  /${NC}"
echo -e "${BLUE}        \/|__|   |__|       \/               \/     \/ ${NC}"
echo
echo -e "${CYAN}=======================================================${NC}"
echo -e "${YELLOW}           Instal·lador de Apps i més ${NC}"
echo -e "${CYAN}=======================================================${NC}"

echo -e "\n${MAGENTA}✨ Instal·lant Apps i més${NC}"

# Función para verificar si un comando fue exitoso
check_success() {
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✅ $1 instal·lat correctament!${NC}"
    else
        echo -e "${RED}❌ Error instal·lant $1${NC}"
    fi
}

# --------- ACTUALITZACIÓ DE PAQUETS ---------

echo -e "${BLUE}⏳ Actualitzant paquets locals...${NC}\n"

sudo apt-get update
sudo apt-get upgrade -y

echo -e "\n${GREEN}✅ Paquets actualitzats amb èxit.${NC}"

# --------- INSTAL·LACIONS AMB APT ---------

echo -e "\n${MAGENTA}🎮 Instal·lant Steam...${NC}"
sudo apt install steam -y
check_success "Steam"

# --------- INSTAL·LACIONS AMB SNAP ---------

echo -e "\n${MAGENTA}🎧 Instal·lant Audacity...${NC}"
sudo snap install audacity
check_success "Audacity"

echo -e "\n${MAGENTA}🎥 Instal·lant VLC...${NC}"
sudo snap install vlc
check_success "VLC"

# --------- SPOTIFY ---------

echo -e "\n${MAGENTA}🎵 Instal·lant Spotify...${NC}"
curl -sS https://download.spotify.com/debian/pubkey_C85668DF69375001.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb https://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client -y
check_success "Spotify"

# --------- REAPER ---------

echo -e "\n${MAGENTA}🎵 Instal·lant Reaper...${NC}"
cd /tmp
wget https://www.reaper.fm/files/7.x/reaper745_linux_x86_64.tar.xz
if [ -f "reaper745_linux_x86_64.tar.xz" ]; then
    tar -xf reaper745_linux_x86_64.tar.xz
    cd reaper_linux_x86_64
    sudo ./install-reaper.sh --install /opt --integrate-desktop
    check_success "Reaper"
    cd /tmp
    rm -rf reaper*
else
    echo -e "${RED}❌ Error descargant Reaper${NC}"
fi

# --------- CREAR DIRECTORIO PARA DESCARGAS ---------

mkdir -p ~/Downloads/Applications
cd ~/Downloads/Applications

# --------- PAQUETS DEB ---------

echo -e "\n${MAGENTA}💬 Instal·lant Discord...${NC}"
wget -O discord.deb "https://discord.com/api/download?platform=linux&format=deb"
if [ -f "discord.deb" ]; then
    sudo apt install ./discord.deb -y
    check_success "Discord"
else
    echo -e "${RED}❌ Error descargant Discord${NC}"
fi

echo -e "\n${MAGENTA}⛏️ Instal·lant Minecraft...${NC}" 
wget https://launcher.mojang.com/download/Minecraft.deb
if [ -f "Minecraft.deb" ]; then
    sudo apt install ./Minecraft.deb -y
    check_success "Minecraft"
else
    echo -e "${RED}❌ Error descargant Minecraft${NC}"
fi

echo -e "\n${MAGENTA}🔧 Instal·lant VS Code...${NC}" 
# Método más confiable para instalar VS Code
curl -L "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -o vscode.deb
if [ -f "vscode.deb" ]; then
    sudo apt install ./vscode.deb -y
    check_success "VS Code"
else
    echo -e "${RED}❌ Error descargant VS Code${NC}"
fi

# --------- LIMPIEZA ---------

echo -e "\n${BLUE}🧹 Netejant fitxers temporals...${NC}"
# Los archivos .deb se quedan en ~/Applications para posible reinstalación
cd ~

# --------- FINALIZACIÓN ---------

echo -e "\n${CYAN}=======================================================${NC}"
echo -e "${GREEN}🎉 Instal·lació completada!${NC}"
echo -e "${CYAN}=======================================================${NC}"
echo -e "${YELLOW}Totes les aplicacions han estat instal·lades.${NC}"
echo -e "${YELLOW}Pot ser necessari reiniciar per a algunes aplicacions.${NC}"