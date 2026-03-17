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
echo -e "${GREEN} /  /_\  \\\\____ \\\\____ \/  ___/  ______  /  ___/  |  \ ${NC}"
echo -e "${CYAN}/    |    \  |_> >  |_> >___ \  /_____/  \___ \|   Y  \\\\${NC}"
echo -e "${MAGENTA}\____|__  /   __/|   __/____  >         /____  >___|  /${NC}"
echo -e "${BLUE}        \/|__|   |__|       \/               \/     \/ ${NC}"
echo
echo -e "${CYAN}=======================================================${NC}"
echo -e "${YELLOW}           Instal·lador de Apps i més ${NC}"
echo -e "${CYAN}=======================================================${NC}"

echo -e "\n${MAGENTA}✨ Instalant Apps i més${NC}"

# --------- ACTUALITZACIÓ DE PAQUETS ---------

echo -e "${BLUE}⏳ Actualitzant paquets locals...${NC}\n"

sudo dnf update -y

echo -e "\n${GREEN}✅ Paquets actualitzats amb éxit.${NC}"

# --------- ACTUALITZACIÓ DE PAQUETS ---------

# Crear directori temporal per descàrregues
mkdir -p ~/Apps
pushd ~/Apps > /dev/null

# --------- REAPER ---------
echo -e "\n${MAGENTA}🎵 Instal·lant Reaper...${NC}"
wget https://www.reaper.fm/files/7.x/reaper765_linux_x86_64.tar.xz
tar -xf reaper765_linux_x86_64.tar.xz
pushd reaper_linux_x86_64 > /dev/null
./install-reaper.sh --install /opt --integrate-desktop --usr-local-bin-symlink
popd > /dev/null
echo -e "${GREEN}✅ Reaper Instal·lat correctament!${NC}"

# ----------------- SNAPS & ALTRES -----------------

echo -e "\n${MAGENTA}🎧 Instal·lant Audacity...${NC}"
flatpak install flathub org.audacityteam.Audacity -y
echo -e "${GREEN}✅ Audacity Instal·lat correctament!${NC}"

echo -e "\n${MAGENTA}📻 Instal·lant Spotify...${NC}"
flatpak install flathub com.spotify.Client -y
echo -e "${GREEN}✅ Spotify Instal·lat correctament!${NC}"

echo -e "\n${MAGENTA}🎥 Instal·lant VLC...${NC}"
flatpak install flathub org.videolan.VLC -y
echo -e "${GREEN}✅ VLC Instal·lat correctament!${NC}"

echo -e "\n${MAGENTA}🔐 Instal·lant Bitwarden...${NC}"
flatpak install flathub com.bitwarden.desktop -y
echo -e "${GREEN}✅ Bitwarden Instal·lat correctament!${NC}"

echo -e "\n${MAGENTA}⛏️ Instal·lant Minecraft...${NC}" 
flatpak install flathub org.prismlauncher.PrismLauncher -y
echo -e "${GREEN}✅ Minecraft Instal·lat correctament!${NC}"

echo -e "\n${MAGENTA}🎮 Instal·lant Dolphin...${NC}" 
flatpak install flathub org.DolphinEmu.dolphin-emu -y
echo -e "${GREEN}✅ Dolphin Instal·lat correctament!${NC}"

echo -e "\n${YELLOW}⚠️  Es reiniciarà el sistema en 10 segons${NC}"
sleep 10
sudo reboot
