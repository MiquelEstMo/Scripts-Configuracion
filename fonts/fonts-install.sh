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

echo -e "${CYAN}========================================${NC}"
echo -e "${YELLOW}   Instal·lador de Nerd Fonts${NC}"
echo -e "${CYAN}========================================${NC}\n"

# ========================================
# CREAR DIRECTORI DE FONTS
# ========================================
echo -e "${MAGENTA}📁 Creant directori de fonts...${NC}"
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
echo -e "${GREEN}✅ Directori creat: ~/.local/share/fonts${NC}\n"

# ========================================
# DESCARREGAR MESLOLGS NERD FONT
# ========================================
echo -e "${MAGENTA}📥 Descarregant MesloLGS Nerd Font...${NC}"

wget -q --show-progress https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget -q --show-progress https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget -q --show-progress https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget -q --show-progress https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

echo -e "${GREEN}✅ MesloLGS Nerd Font descarregada correctament.${NC}\n"

# ========================================
# DESCARREGAR JETBRAINSMONO NERD FONT
# ========================================
echo -e "${MAGENTA}📥 Descarregant JetBrainsMono Nerd Font...${NC}"

# URL de la última versió
JETBRAINS_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip"

wget -q --show-progress -O JetBrainsMono.zip "$JETBRAINS_URL"

echo -e "${MAGENTA}📦 Descomprimint JetBrainsMono...${NC}"
unzip -q JetBrainsMono.zip -d JetBrainsMono
rm JetBrainsMono.zip

echo -e "${GREEN}✅ JetBrainsMono Nerd Font descarregada i descomprimida.${NC}\n"

# ========================================
# ACTUALITZAR CACHE DE FONTS
# ========================================
echo -e "${MAGENTA}🔄 Actualitzant cache de fonts del sistema...${NC}"
fc-cache -fv > /dev/null 2>&1
echo -e "${GREEN}✅ Cache de fonts actualitzada correctament.${NC}\n"

# ========================================
# VERIFICAR INSTAL·LACIÓ
# ========================================
echo -e "${CYAN}🔍 Verificant fonts instal·lades:${NC}\n"

if fc-list | grep -i "MesloLGS NF" > /dev/null; then
    echo -e "${GREEN}✅ MesloLGS Nerd Font detectada${NC}"
else
    echo -e "${RED}❌ MesloLGS Nerd Font NO detectada${NC}"
fi

if fc-list | grep -i "JetBrainsMono Nerd Font" > /dev/null; then
    echo -e "${GREEN}✅ JetBrainsMono Nerd Font detectada${NC}"
else
    echo -e "${RED}❌ JetBrainsMono Nerd Font NO detectada${NC}"
fi


mkdir ~/.local/share/fonts/
wget https://github.com/samuelngs/apple-emoji-linux/releases/latest/download/AppleColorEmoji.ttf -O ~/.local/share/fonts/AppleColorEmoji.ttf
nano /etc/fonts/conf.d/60-generic.conf
mkdir ~/.config/fontconfig/	
tee ~/.config/fontconfig/fonts.conf << FONTS	
<?xml version="1.0" encoding="UTF-8"?>	
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">	
<fontconfig>	
  <alias>	
    <family>serif</family>	
    <prefer>	
      <family>Apple Color Emoji</family>	
    </prefer>	
  </alias>	
  <alias>	
    <family>sans-serif</family>	
    <prefer>	
      <family>Apple Color Emoji</family>	
    </prefer>	
  </alias>	
  <alias>	
    <family>monospace</family>	
    <prefer>	
      <family>Apple Color Emoji</family>	
    </prefer>	
  </alias>	
  <match target="pattern">	
    <test qual="any" name="family"><string>Noto Color Emoji</string></test>	
    <edit name="family" mode="assign" binding="same"><string>Apple Color Emoji</string></edit>	
  </match>	
</fontconfig>	
FONTS	


# ========================================
# INSTRUCCIONS FINALS
# ========================================
echo -e "\n${CYAN}========================================${NC}"
echo -e "${YELLOW}   Instal·lació completada!${NC}"
echo -e "${CYAN}========================================${NC}\n"

echo -e "${MAGENTA}📝 Per usar les fonts a VS Code:${NC}"
echo -e "${CYAN}1. Obre VS Code${NC}"
echo -e "${CYAN}2. Configuració (Ctrl+,) → Cerca 'terminal font'${NC}"
echo -e "${CYAN}3. Afegeix:${NC}"
echo -e '   "terminal.integrated.fontFamily": "JetBrainsMono Nerd Font"'
echo -e "${CYAN}   o${NC}"
echo -e '   "terminal.integrated.fontFamily": "MesloLGS NF"'
echo -e "\n${MAGENTA}📝 Per usar les fonts a Kitty:${NC}"
echo -e "${CYAN}Edita ~/.config/kitty/kitty.conf:${NC}"
echo -e "   font_family JetBrainsMono Nerd Font"
echo -e "${CYAN}   o${NC}"
echo -e "   font_family MesloLGS NF"

echo -e "\n${GREEN}🎉 Gaudeix de les teves noves fonts!${NC}\n"

cd ~