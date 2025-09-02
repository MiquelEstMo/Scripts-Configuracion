#!/bin/bash

# Colores para la salida
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Banner de desinstalación
echo -e "${RED}"
echo "██████╗ ███████╗██╗██╗     ███████╗██╗██████╗ ███████╗██████╗ "
echo "██╔══██╗██╔════╝██║██║     ██╔════╝██║██╔══██╗██╔════╝██╔══██╗"
echo "██║  ██║█████╗  ██║██║     █████╗  ██║██████╔╝█████╗  ██████╔╝"
echo "██║  ██║██╔══╝  ██║██║     ██╔══╝  ██║██╔══██╗██╔══╝  ██╔══██╗"
echo "██████╔╝██║     ██║███████╗██║     ██║██║  ██║███████╗██║  ██║"
echo "╚═════╝ ╚═╝     ╚═╝╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝"
echo -e "${NC}"
echo -e "${YELLOW}=======================================================${NC}"
echo -e "${RED}         DESINSTALADOR DE NEOVIM & NVCHAD${NC}"
echo -e "${YELLOW}=======================================================${NC}"

# Función para confirmar desinstalación
confirm_uninstall() {
    echo -e "${YELLOW}¿Estás seguro de que quieres desinstalar todo? (y/N)${NC}"
    read -r response
    case "$response" in
        [yY][eE][sS]|[yY])
            return 0
            ;;
        *)
            echo -e "${GREEN}Desinstalación cancelada.${NC}"
            exit 0
            ;;
    esac
}

# Confirmar antes de proceder
confirm_uninstall

# --------- DESINSTALAR NVCHAD ---------
echo -e "\n${RED}🗑️  Eliminando NvChad...${NC}"
if [ -d ~/.config/nvim ]; then
    rm -rf ~/.config/nvim
    echo -e "${GREEN}✅ NvChad eliminado correctamente.${NC}"
else
    echo -e "${YELLOW}⚠️  NvChad no estaba instalado.${NC}"
fi

# --------- DESINSTALAR NEOVIM ---------
echo -e "\n${RED}🗑️  Desinstalando NeoVim...${NC}"

# Eliminar enlace simbólico
if [ -L /usr/local/bin/nvim ]; then
    sudo rm -f /usr/local/bin/nvim
    echo -e "${GREEN}✅ Enlace simbólico eliminado.${NC}"
fi

# Eliminar archivo AppImage
if [ -f ~/Applications/nvim-linux-x86_64.appimage ]; then
    rm -f ~/Applications/nvim-linux-x86_64.appimage
    echo -e "${GREEN}✅ Archivo AppImage eliminado.${NC}"
fi

# Eliminar directorio Applications si está vacío
if [ -d ~/Applications ] && [ -z "$(ls -A ~/Applications)" ]; then
    rmdir ~/Applications
    echo -e "${GREEN}✅ Directorio Applications eliminado.${NC}"
fi

# --------- LIMPIEZA ADICIONAL ---------
echo -e "\n${RED}🧹 Realizando limpieza adicional...${NC}"

# Eliminar cache de NeoVim
if [ -d ~/.cache/nvim ]; then
    rm -rf ~/.cache/nvim
    echo -e "${GREEN}✅ Cache de NeoVim eliminado.${NC}"
fi

# Eliminar local state de NeoVim
if [ -d ~/.local/share/nvim ]; then
    rm -rf ~/.local/share/nvim
    echo -e "${GREEN}✅ Datos locales de NeoVim eliminados.${NC}"
fi

# Eliminar configuraciones de respaldo si existen
if [ -d ~/.config/nvim.backup.* ]; then
    rm -rf ~/.config/nvim.backup.*
    echo -e "${GREEN}✅ Copias de seguridad eliminadas.${NC}"
fi

# --------- MENSAJE FINAL ---------
echo -e "\n${GREEN}"
echo "======================================================="
echo "✅ DESINSTALACIÓN COMPLETADA CORRECTAMENTE"
echo "======================================================="
echo -e "${NC}"
echo -e "${YELLOW}🗑️  Todos los componentes de NeoVim y NvChad han sido eliminados.${NC}"
echo -e "${YELLOW}📝 Nota: Las dependencias del sistema instaladas (git, wget, etc.)"
echo -e "    no se han eliminado. Puedes eliminarlas manualmente si lo deseas.${NC}"
