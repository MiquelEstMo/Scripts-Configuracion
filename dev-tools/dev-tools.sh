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

echo -e "${RED}________  _______________   ____      ___________________   ________  .____       _________${NC}"
echo -e "${YELLOW}\______ \ \_   _____/\   \ /   /      \__    ___/\_____  \  \_____  \ |    |     /   _____/${NC}"
echo -e "${GREEN} |    |  \ |    __)_  \   Y   /  ______ |    |    /   |   \  /   |   \|    |     \_____  \ ${NC}"
echo -e "${CYAN} |    \`   \|        \  \     /  /_____/ |    |   /    |    \/    |    \    |___  /        \ ${NC}"
echo -e "${MAGENTA}/_______  /_______  /   \___/           |____|   \_______  /\_______  /_______ \/_______  /${NC}"
echo -e "${BLUE}        \/        \/                                     \/         \/        \/        \/ ${NC}"
echo
echo -e "${CYAN}=======================================================================${NC}"
echo -e "${YELLOW}                 Instal lació essentials-dev ${NC}"
echo -e "${CYAN}=======================================================================${NC}"

echo -e "\n${MAGENTA}✨ Instalant essentials-dev${NC}"

# ------------------------ BANNER ------------------------


# --------- ACTUALITZACIÓ DE PAQUETS ---------

echo -e "${BLUE}⏳ Actualitzant paquets locals...${NC}\n"

sudo dnf update -y

echo -e "\n${GREEN}✅ Paquets actualitzats amb éxit.${NC}"

# --------- ACTUALITZACIÓ DE PAQUETS ---------

# --------- EINES DE BASIQUES ---------

echo -e "\n${MAGENTA}🔧 Instal·lant eines bàsiques del sistema...${NC}"

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1

echo -e "\n${MAGENTA}✨ Instal·lant Git...${NC}"
sudo dnf install git -y
git --version
echo -e "${GREEN}✅ Git Instal·lat correctament!${NC}"

echo -e "\n${MAGENTA}✨ Instal·lant Curl...${NC}"
sudo dnf install curl -y
echo -e "${GREEN}✅ Curl Instal·lat correctament!${NC}"

echo -e "\n${MAGENTA}✨ Instal·lant Wget...${NC}"
sudo dnf install wget -y
echo -e "${GREEN}✅ Wget Instal·lat correctament!${NC}"

echo -e "\n${MAGENTA}📦 Instal·lant Tar...${NC}"
sudo dnf install tar -y
echo -e "${GREEN}✅ Tar Instal·lat correctament!${NC}"

echo -e "\n${MAGENTA}✨ Instal·lant FastFetch...${NC}"
sudo dnf install fastfetch -y
echo -e "${GREEN}✅ Fastfetch Instal·lat correctament!${NC}"

echo -e "${GREEN}🎉 Totes les eines de bàsiques s'han instal·lat correctament!${NC}"

# --------- EINES DE BASIQUES ---------


# --------- EINES DE DESENVOLUPAMENT ---------
echo -e "\n${GREEN}👨‍💻 Instal·lant eines de desenvolupament...${NC}"

echo -e "${CYAN}🐍 Instal·lant Python3...${NC}"
sudo dnf install -y python3
echo -e "${GREEN}✅ Python3 instal·lat correctament!${NC}"

echo -e "${CYAN}📦 Instal·lant Python3-pip...${NC}"
sudo dnf install -y python3-pip
echo -e "${GREEN}✅ Python3-pip instal·lat correctament!${NC}"

echo -e "${CYAN}🟢 Instal·lant Node.js...${NC}"
sudo dnf install -y nodejs
echo -e "${GREEN}✅ Node.js instal·lat correctament!${NC}"

echo -e "${CYAN}📋 Instal·lant NPM...${NC}"
sudo dnf install -y npm
echo -e "${GREEN}✅ NPM instal·lat correctament!${NC}"

echo -e "${CYAN}☕ Instal·lant Java JDK...${NC}"
sudo dnf install -y java-latest-openjdk-devel
echo -e "${GREEN}✅ Java JDK instal·lat correctament!${NC}"

echo -e "${CYAN}⚙️ Instal·lant GCC...${NC}"
sudo dnf install -y gcc
echo -e "${GREEN}✅ GCC instal·lat correctament!${NC}"

echo -e "${CYAN}🔧 Instal·lant G++...${NC}"
sudo dnf install -y gcc-c++
echo -e "${GREEN}✅ G++ instal·lat correctament!${NC}"

echo -e "${CYAN}🔨 Instal·lant Make...${NC}"
sudo dnf install -y make
echo -e "${GREEN}✅ Make instal·lat correctament!${NC}"

echo -e "${CYAN}🏗️ Instal·lant CMake...${NC}"
sudo dnf install -y cmake
echo -e "${GREEN}✅ CMake instal·lat correctament!${NC}"

echo -e "${CYAN}🐛 Instal·lant GDB...${NC}"
sudo dnf install -y gdb
echo -e "${GREEN}✅ GDB instal·lat correctament!${NC}"

echo -e "${CYAN}🔍 Instal·lant Valgrind...${NC}"
sudo dnf install -y valgrind
echo -e "${GREEN}✅ Valgrind instal·lat correctament!${NC}"

echo -e "${CYAN}📦 Instal·lant Plymouth...${NC}"
sudo dnf install -y plymouth plymouth-themes
echo -e "${GREEN}✅ Plymouth instal·lat correctament!${NC}"

echo -e "\n${MAGENTA}📦 Instal·lant Flatpak...${NC}"
sudo dnf install flatpak -y
sudo dnf install -y gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
echo -e "${GREEN}✅ Flatpak Instal·lat correctament!${NC}"


echo -e "${CYAN}📄 Instal·lant TinyTeX (LaTeX)...${NC}"
wget -qO- "https://yihui.org/tinytex/install-bin-unix.sh" | sh
echo -e "${GREEN}✅ TinyTeX (LaTeX) instal·lat correctament!${NC}"


echo -e "${GREEN}🎉 Totes les eines de desenvolupament s'han instal·lat correctament!${NC}"


# --------- MISSATGE FINAL ---------

echo -e "\n${CYAN}=======================================================================${NC}"
echo -e "${GREEN}🎊 INSTAL·LACIÓ COMPLETADA AMB ÈXIT! 🎊${NC}"
echo -e "${CYAN}=======================================================================${NC}"

echo -e "\n${YELLOW}📋 RESUM D'EINES INSTAL·LADES:${NC}"
echo -e "${MAGENTA}   🔧 Eines bàsiques:${NC}"
echo -e "${CYAN}      • Git - Control de versions${NC}"
echo -e "${CYAN}      • Curl - Descàrregues HTTP${NC}"
echo -e "${CYAN}      • Wget - Descàrregues de fitxers${NC}"
echo -e "${CYAN}      • FastFetch - Informació del sistema${NC}"

echo -e "${MAGENTA}   👨‍💻 Eines de desenvolupament:${NC}"
echo -e "${CYAN}      • Python3 & Pip - Llenguatge Python${NC}"
echo -e "${CYAN}      • Node.js & NPM - JavaScript runtime${NC}"
echo -e "${CYAN}      • Java JDK - Desenvolupament Java${NC}"
echo -e "${CYAN}      • GCC & G++ - Compiladors C/C++${NC}"
echo -e "${CYAN}      • Make & CMake - Eines de construcció${NC}"
echo -e "${CYAN}      • GDB & Valgrind - Debugging i profiling${NC}"
echo -e "${CYAN}      • TinyTeX - Composició de documents LaTeX${NC}"

echo -e "\n${GREEN}🚀 SEGÜENTS PASSOS RECOMANATS:${NC}"
echo -e "${YELLOW}   1. Configura Git amb les teves credencials:${NC}"
echo -e "${CYAN}      git config --global user.name \"El teu nom\"${NC}"
echo -e "${CYAN}      git config --global user.email \"el-teu@email.com\"${NC}"

echo -e "${YELLOW}   2. Verifica les versions instal·lades:${NC}"
echo -e "${CYAN}      python3 --version && node --version && java -version${NC}"

echo -e "${YELLOW}   3. Prova FastFetch per veure la informació del sistema:${NC}"
echo -e "${CYAN}      fastfetch${NC}"

echo -e "\n${MAGENTA}💡 CONSELL: Reinicia la terminal per assegurar-te que tots els canvis tinguin efecte.${NC}"

echo -e "\n${GREEN}✨ Gaudeix programant amb les teves noves eines! ✨${NC}"
echo -e "${CYAN}=======================================================================${NC}"

echo -e "\n${YELLOW}⚠️  Es reiniciarà el sistema en 10 segons${NC}"
sleep 10
sudo reboot

# --------- MISSATGE FINAL ---------
