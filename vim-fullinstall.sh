#!/bin/bash

# Colores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# Funciones para mensajes
print_header() {
    echo -e "${PURPLE}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${PURPLE}║${WHITE}                    $1                    ${PURPLE}║${NC}"
    echo -e "${PURPLE}╚══════════════════════════════════════════════════════════════╝${NC}"
    echo
}

print_step() {
    echo -e "${BLUE}▶${NC} ${WHITE}$1${NC}"
}

print_success() {
    echo -e "${GREEN}✓${NC} ${GREEN}$1${NC}"
}

print_info() {
    echo -e "${CYAN}ℹ${NC} ${CYAN}$1${NC}"
}

print_separator() {
    echo -e "${YELLOW}════════════════════════════════════════════════════════════════${NC}"
}

# Banner de inicio
clear
echo -e "${PURPLE}"
cat << "EOF"
 ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
 ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
 ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
 ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
 ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
 ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
                    
           ███╗   ██╗██╗   ██╗ ██████╗██╗  ██╗ █████╗ ██████╗ 
           ████╗  ██║██║   ██║██╔════╝██║  ██║██╔══██╗██╔══██╗
           ██╔██╗ ██║██║   ██║██║     ███████║███████║██║  ██║
           ██║╚██╗██║╚██╗ ██╔╝██║     ██╔══██║██╔══██║██║  ██║
           ██║ ╚████║ ╚████╔╝ ╚██████╗██║  ██║██║  ██║██████╔╝
           ╚═╝  ╚═══╝  ╚═══╝   ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ 
EOF
echo -e "${NC}"

print_header "INSTAL·LADOR AUTOMÀTIC DE NEOVIM + NVCHAD"
print_info "Aquest script instal·larà Neovim i NvChad al teu sistema"
echo

# Pausa dramática
sleep 2

print_separator

# ════════════════════════════════════════════════════════════════
# ACTUALITZACIÓ DE PAQUETS
# ════════════════════════════════════════════════════════════════

print_header "ACTUALITZANT EL SISTEMA"
print_step "Actualitzant paquets locals..."
echo

sudo apt-get update
sudo apt-get upgrade -y

echo
print_success "Paquets actualitzats amb èxit!"
sleep 1

print_separator

# ════════════════════════════════════════════════════════════════
# INSTAL·LACIÓ DE NEOVIM
# ════════════════════════════════════════════════════════════════

print_header "INSTAL·LANT NEOVIM"

print_step "Creant directori Applications..."
mkdir -p ~/Applications

print_step "Navegant al directori d'aplicacions..."
cd ~/Applications

print_step "Descarregant Neovim AppImage..."
wget --progress=bar https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.appimage

echo
print_step "Donant permisos d'execució..."
chmod +x nvim-linux-x86_64.appimage

print_step "Eliminant enllaços anteriors..."
sudo rm -f /usr/local/bin/nvim

print_step "Creant enllaç simbòlic global..."
sudo ln -s ~/Applications/nvim-linux-x86_64.appimage /usr/local/bin/nvim

echo
print_step "Verificant instal·lació..."
nvim --version

echo
print_success "NeoVim instal·lat correctament!"
sleep 1

print_separator

# ════════════════════════════════════════════════════════════════
# INSTAL·LACIÓ DE NVCHAD
# ════════════════════════════════════════════════════════════════

print_header "INSTAL·LANT NVCHAD"

print_step "Fent backup de configuració anterior (si existeix)..."
if [ -d ~/.config/nvim ]; then
    mv ~/.config/nvim ~/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)
    print_info "Backup creat: ~/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)"
fi

print_step "Clonant NvChad starter config..."
git clone https://github.com/NvChad/starter ~/.config/nvim

echo
print_success "NvChad instal·lat correctament!"

print_separator

# ════════════════════════════════════════════════════════════════
# FINALITZACIÓ
# ════════════════════════════════════════════════════════════════

echo
print_header "INSTAL·LACIÓ COMPLETADA"

echo -e "${GREEN}"
cat << "EOF"
    ✨ ÈXIT! NEOVIM + NVCHAD INSTAL·LATS ✨

     🚀 Executa 'nvim' per començar
     📚 Primera vegada? NvChad et guiarà
     🎨 Gaudeix de la teva nova configuració!
EOF
echo -e "${NC}"

print_info "Consells:"
echo -e "  ${CYAN}•${NC} Executa: ${YELLOW}nvim${NC}"
echo -e "  ${CYAN}•${NC} Per sortir: ${YELLOW}ESC${NC} després ${YELLOW}:q${NC}"
echo -e "  ${CYAN}•${NC} Per ajuda: ${YELLOW}:help${NC}"

echo
print_separator
print_success "Script finalitzat correctament! Gaudeix de Neovim! 🎉"
