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

sudo apt-get update
sudo apt-get upgrade -y

echo -e "\n${GREEN}✅ Paquets actualitzats amb éxit.${NC}"

# --------- ACTUALITZACIÓ DE PAQUETS ---------

echo -e "\n${MAGENTA}🎮 Instal·lant Steam...${NC}"
sudo apt install steam -y
echo -e "${GREEN}✅ Steam Instal·lat correctament!${NC}"

echo -e "\n${MAGENTA}🎵 Instal·lant Reaper...${NC}"
wget https://www.reaper.fm/files/7.x/reaper745_linux_x86_64.tar.xz
tar -xf reaper745_linux_x86_64.tar.xz
cd reaper745_linux_x86_64
bash install-reaper.sh
echo -e "${GREEN}✅ Reaper Instal·lat correctament!${NC}"

echo -e "\n${MAGENTA}🎧 Instal·lant Audacity...${NC}"
sudo snap install audacity -y
echo -e "${GREEN}✅ Audacity Instal·lat correctament!${NC}"

echo -e "\n${MAGENTA}📻 Instal·lant Spotify...${NC}"
curl -sS https://download.spotify.com/debian/pubkey_C85668DF69375001.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb https://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client
echo -e "${GREEN}✅ Audacity Instal·lat correctament!${NC}"

echo -e "\n${MAGENTA}🎥 Instal·lant VLC...${NC}"
sudo snap install vlc
echo -e "${GREEN}✅ VLC Instal·lat correctament!${NC}"

# ----------------- PAQUETS DEB -----------------

cd Applications

echo -e "\n${MAGENTA}💬 Instal·lant Discord...${NC}"
wget https://discord.com/api/download?platform=linux&format=deb
sudo apt install ./discord-0.0.108.deb
echo -e "${GREEN}✅ Discord Instal·lat correctament!${NC}"

echo -e "\n${MAGENTA}⛏️ Instal·lant Minecraft...${NC}" 
wget https://launcher.mojang.com/download/Minecraft.deb
sudo apt install ./Minecraft.deb
echo -e "${GREEN}✅ Minecraft Instal·lat correctament!${NC}"

echo -e "\n${MAGENTA}🔧 Instal·lant VS-Code...${NC}" 
wget https://launcher.mojang.com/download/Minecraft.deb
sudo apt install ./code_1.103.2-1755709794_amd64.deb
echo -e "${GREEN}✅ VS-Code Instal·lat correctament!${NC}"

# ----------------- PAQUETS DEB -----------------