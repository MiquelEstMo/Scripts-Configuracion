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

# ========================================
# ACTUALITZACIÓ DE PAQUETS
# ========================================
echo -e "${BLUE}⏳ Actualitzant paquets locals...${NC}\n"
sudo apt-get update
sudo apt-get upgrade -y
echo -e "\n${GREEN}✅ Paquets actualitzats amb éxit.${NC}"

# ========================================
# ACTIVAR ARQUITECTURA 32 BITS
# ========================================
echo -e "\n${MAGENTA}🔧 Activant arquitectura de 32 bits...${NC}"
sudo dpkg --add-architecture i386
sudo apt update
echo -e "${GREEN}✅ Arquitectura de 32 bits activada.${NC}"

# ========================================
# INSTAL·LAR DRIVERS AMD MESA
# ========================================
echo -e "\n${MAGENTA}🎨 Instal·lant drivers AMD Mesa...${NC}"
sudo apt install -y \ mesa-vulkan-drivers \ mesa-vulkan-drivers:i386 \ libgl1-mesa-dri:i386 \ mesa-va-drivers \ mesa-vdpau-drivers \ libglx-mesa0:i386
echo -e "${GREEN}✅ Drivers AMD Mesa instal·lats correctament.${NC}"

# ========================================
# INSTAL·LAR SUPORT VULKAN
# ========================================
echo -e "\n${MAGENTA}🔥 Instal·lant suport Vulkan...${NC}"
sudo apt install -y \ vulkan-tools \ vulkan-validationlayers \ libvulkan1 \ libvulkan1:i386

echo -e "\n${CYAN}🔍 Verificant GPU detectada:${NC}"
vulkaninfo | grep "deviceName"

echo -e "\n${MAGENTA}📦 Instal·lant driver AMDVLK...${NC}"
sudo apt install -y amdvlk amdvlk:i386
echo -e "${GREEN}✅ Vulkan instal·lat i configurat correctament.${NC}"

# ========================================
# INSTAL·LAR STEAM
# ========================================
echo -e "\n${MAGENTA}🎮 Instal·lant Steam...${NC}"
wget -O steam.deb https://cdn.fastly.steamstatic.com/client/installer/steam.deb
sudo apt install -y ./steam.deb

echo -e "\n${MAGENTA}📦 Instal·lant dependències addicionals...${NC}"
sudo apt install -y \ libgl1-mesa-glx:i386 \ libxcb-dri3-0:i386 \ libxcb-present0:i386
echo -e "${GREEN}✅ Steam instal·lat correctament.${NC}"

# ========================================
# INSTAL·LAR PROTONUP-QT
# ========================================

echo -e "\n${MAGENTA}⚙️  Instal·lant ProtonUp-Qt (gestor de ProtonGE)...${NC}"
flatpak install -y flathub net.davidotek.pupgui2
echo -e "${GREEN}✅ ProtonUp-Qt instal·lat.${NC}"
echo -e "${CYAN}💡 Executa 'flatpak run net.davidotek.pupgui2' per gestionar ProtonGE.${NC}"

# ========================================
# INSTAL·LAR LUTRIS + WINE-GE
# ========================================

echo -e "\n${MAGENTA}🕹️  Instal·lant Lutris...${NC}"
echo -e "Types: deb\nURIs: https://download.opensuse.org/repositories/home:/strycore/Debian_12/\nSuites: ./\nComponents: \nSigned-By: /etc/apt/keyrings/lutris.gpg" | sudo tee /etc/apt/sources.list.d/lutris.sources > /dev/null
wget -q -O- https://download.opensuse.org/repositories/home:/strycore/Debian_12/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/lutris.gpg
sudo apt update
sudo apt install -y lutris
echo -e "${GREEN}✅ Lutris instal·lat correctament.${NC}"

echo -e "\n${MAGENTA}🍷 Instal·lant Wine-GE per Lutris...${NC}"
mkdir -p ~/.local/share/lutris/runners/wine
cd ~/.local/share/lutris/runners/wine
wget https://github.com/GloriousEggroll/wine-ge-custom/releases/download/GE-Proton9-20/wine-ge-9-20-x86_64.tar.xz
tar -xf wine-ge-9-20-x86_64.tar.xz
rm wine-ge-9-20-x86_64.tar.xz
cd ~
echo -e "${GREEN}✅ Wine-GE instal·lat correctament.${NC}"

# ========================================
# INSTAL·LAR GAMEMODE
# ========================================

echo -e "\n${MAGENTA}⚡ Instal·lant GameMode (millora de rendiment)...${NC}"
sudo apt install -y gamemode
echo -e "${GREEN}✅ GameMode instal·lat correctament.${NC}"