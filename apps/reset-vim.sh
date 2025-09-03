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

echo -e "${RED}____   ____.___   _____    ______ ________${NC}"
echo -e "${YELLOW}\   \ /   /|   | /     \   \____ \\\\______ \\${NC}"
echo -e "${GREEN} \   Y   / |   |/  \ /  \  |  |_> >|    |  \\${NC}"
echo -e "${CYAN}  \     /  |   /    Y    \ |   __/ |    \`   \\${NC}"
echo -e "${MAGENTA}   \___/   |___\____|__  / |__|   /_______  /${NC}"
echo -e "${BLUE}                       \/                 \/ ${NC}"
echo
echo -e "${CYAN}=======================================================${NC}"
echo -e "${YELLOW}      Desinstal·lador de NeoVim & NvChad${NC}"
echo -e "${CYAN}=======================================================${NC}"

echo -e "\n${MAGENTA}🗑️  Eliminant NeoVim && NvChad${NC}"

# ------------------------ BANNER ------------------------

# --------- CONFIRMACIÓ ---------

echo -e "\n${YELLOW}⚠️  ATENCIÓ: Aquest script eliminarà completament:${NC}"
echo -e "${CYAN}   • NeoVim AppImage de ~/Applications${NC}"
echo -e "${CYAN}   • Enllaç simbòlic /usr/local/bin/nvim${NC}"
echo -e "${CYAN}   • Configuració NvChad de ~/.config/nvim${NC}"
echo -e "${CYAN}   • Carpeta ~/.local/share/nvim (dades de NeoVim)${NC}"
echo -e "${CYAN}   • Carpeta ~/.local/state/nvim (estat de NeoVim)${NC}"
echo -e "${CYAN}   • Cache de ~/.cache/nvim${NC}"

echo -e "\n${RED}Vols continuar? (s/N): ${NC}"
read -r confirmacio

if [[ ! "$confirmacio" =~ ^[sS]$ ]]; then
    echo -e "${YELLOW}❌ Operació cancel·lada.${NC}"
    exit 0
fi

# --------- CONFIRMACIÓ ---------

# -------------------------- ELIMINACIÓ DE NEOVIM --------------------------

echo -e "\n${MAGENTA}🗑️  Eliminant NeoVim...${NC}"

# Eliminar enllaç simbòlic
if [ -L "/usr/local/bin/nvim" ]; then
    echo -e "${BLUE}   • Eliminant enllaç simbòlic /usr/local/bin/nvim...${NC}"
    sudo rm -f /usr/local/bin/nvim
    echo -e "${GREEN}   ✅ Enllaç simbòlic eliminat.${NC}"
else
    echo -e "${YELLOW}   ℹ️  No s'ha trobat l'enllaç simbòlic /usr/local/bin/nvim${NC}"
fi

# Eliminar AppImage
if [ -f "$HOME/Applications/nvim-linux-x86_64.appimage" ]; then
    echo -e "${BLUE}   • Eliminant NeoVim AppImage...${NC}"
    rm -f "$HOME/Applications/nvim-linux-x86_64.appimage"
    echo -e "${GREEN}   ✅ NeoVim AppImage eliminat.${NC}"
else
    echo -e "${YELLOW}   ℹ️  No s'ha trobat l'AppImage de NeoVim${NC}"
fi

# Eliminar carpeta Applications si està buida
if [ -d "$HOME/Applications" ] && [ -z "$(ls -A "$HOME/Applications")" ]; then
    echo -e "${BLUE}   • Eliminant carpeta Applications buida...${NC}"
    rmdir "$HOME/Applications"
    echo -e "${GREEN}   ✅ Carpeta Applications eliminada.${NC}"
fi

echo -e "${GREEN}✅ NeoVim eliminat correctament!${NC}"

# -------------------------- ELIMINACIÓ DE NEOVIM --------------------------

# -------------------------- ELIMINACIÓ DE NVCHAD --------------------------

echo -e "\n${MAGENTA}🗑️  Eliminant NvChad i configuració...${NC}"

# Eliminar configuració de NeoVim
if [ -d "$HOME/.config/nvim" ]; then
    echo -e "${BLUE}   • Eliminant configuració NvChad (~/.config/nvim)...${NC}"
    rm -rf "$HOME/.config/nvim"
    echo -e "${GREEN}   ✅ Configuració NvChad eliminada.${NC}"
else
    echo -e "${YELLOW}   ℹ️  No s'ha trobat la configuració de NeoVim${NC}"
fi

# Eliminar dades locals de NeoVim
if [ -d "$HOME/.local/share/nvim" ]; then
    echo -e "${BLUE}   • Eliminant dades locals de NeoVim (~/.local/share/nvim)...${NC}"
    rm -rf "$HOME/.local/share/nvim"
    echo -e "${GREEN}   ✅ Dades locals eliminades.${NC}"
else
    echo -e "${YELLOW}   ℹ️  No s'han trobat dades locals de NeoVim${NC}"
fi

# Eliminar estat de NeoVim
if [ -d "$HOME/.local/state/nvim" ]; then
    echo -e "${BLUE}   • Eliminant estat de NeoVim (~/.local/state/nvim)...${NC}"
    rm -rf "$HOME/.local/state/nvim"
    echo -e "${GREEN}   ✅ Estat de NeoVim eliminat.${NC}"
else
    echo -e "${YELLOW}   ℹ️  No s'ha trobat l'estat de NeoVim${NC}"
fi

# Eliminar cache de NeoVim
if [ -d "$HOME/.cache/nvim" ]; then
    echo -e "${BLUE}   • Eliminant cache de NeoVim (~/.cache/nvim)...${NC}"
    rm -rf "$HOME/.cache/nvim"
    echo -e "${GREEN}   ✅ Cache de NeoVim eliminat.${NC}"
else
    echo -e "${YELLOW}   ℹ️  No s'ha trobat el cache de NeoVim${NC}"
fi

echo -e "${GREEN}✅ NvChad i configuració eliminats correctament!${NC}"

# -------------------------- ELIMINACIÓ DE NVCHAD --------------------------

# -------------------------- RESUM FINAL --------------------------

echo -e "\n${GREEN}🎉 Desinstal·lació completada!${NC}"
echo -e "${CYAN}=======================================================${NC}"
echo -e "${YELLOW}   NeoVim i NvChad han estat eliminats completament${NC}"
echo -e "${YELLOW}   del teu sistema.${NC}"
echo -e "${CYAN}=======================================================${NC}"

# Verificar si encara existeix nvim en el PATH
if command -v nvim >/dev/null 2>&1; then
    echo -e "\n${YELLOW}⚠️  NOTA: Encara es pot trobar 'nvim' en el sistema.${NC}"
    echo -e "${YELLOW}   Pot ser que tinguis altres instal·lacions de NeoVim.${NC}"
    echo -e "${BLUE}   Ubicació trobada: $(which nvim)${NC}"
else
    echo -e "\n${GREEN}✅ 'nvim' ja no està disponible al sistema.${NC}"
fi

# -------------------------- RESUM FINAL --------------------------