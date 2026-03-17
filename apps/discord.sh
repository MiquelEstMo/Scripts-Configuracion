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
echo -e "${CYAN}=======================================================${NC}"
echo -e "${MAGENTA}            💬 Instal·lador de Discord${NC}"
echo -e "${CYAN}=======================================================${NC}"
echo

# --------- RPM FUSION NONFREE ---------
echo -e "${BLUE}🔧 Habilitant RPM Fusion Nonfree...${NC}"

if dnf repolist | grep -q "rpmfusion-nonfree"; then
    echo -e "${YELLOW}⚠️  RPM Fusion Nonfree ja està habilitat.${NC}"
else
    sudo dnf install -y \
        "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %{fedora}).noarch.rpm"
    echo -e "${GREEN}✅ RPM Fusion Nonfree habilitat correctament!${NC}"
fi

# --------- INSTAL·LACIÓ DE DISCORD ---------
echo -e "\n${MAGENTA}💬 Instal·lant Discord...${NC}"
sudo dnf install -y discord
echo -e "${GREEN}✅ Discord instal·lat correctament!${NC}"

echo -e "\n${CYAN}=======================================================${NC}"
echo -e "${GREEN}   🎉 Procés completat amb èxit!${NC}"
echo -e "${CYAN}=======================================================${NC}"
