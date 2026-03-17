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
echo -e "${MAGENTA}     💬 Discord Updater - Actualització Automàtica${NC}"
echo -e "${CYAN}=======================================================${NC}"
echo

# --------- CONFIGURACIÓ ---------
DOWNLOAD_URL="https://discord.com/api/download?platform=linux&format=deb"
TMP_DIR=$(mktemp -d)
DEB_FILE="${TMP_DIR}/discord.deb"

# --------- FUNCIONS ---------

cleanup() {
    rm -rf "$TMP_DIR"
}
trap cleanup EXIT

get_installed_version() {
    dpkg-query -W -f='${Version}' discord 2>/dev/null
}

get_remote_version() {
    # Seguim la redirecció i extraiem la versió del nom del fitxer
    local redirect_url
    redirect_url=$(curl -sI -o /dev/null -w '%{url_effective}' -L "$DOWNLOAD_URL" 2>/dev/null)
    echo "$redirect_url" | grep -oP 'discord-\K[0-9]+\.[0-9]+\.[0-9]+'
}

# --------- COMPROVAR DEPENDÈNCIES ---------
if ! command -v curl &>/dev/null; then
    echo -e "${RED}❌ curl no està instal·lat. Instal·la'l amb: sudo apt install curl${NC}"
    exit 1
fi

# --------- OBTENIR VERSIONS ---------
echo -e "${BLUE}🔍 Comprovant versió instal·lada...${NC}"
INSTALLED_VERSION=$(get_installed_version)

if [ -z "$INSTALLED_VERSION" ]; then
    echo -e "${YELLOW}⚠️  Discord no està instal·lat. Es procedirà a la instal·lació.${NC}"
    INSTALLED_VERSION="cap"
else
    echo -e "${GREEN}   Versió instal·lada: ${INSTALLED_VERSION}${NC}"
fi

echo -e "${BLUE}🌐 Comprovant última versió disponible...${NC}"
REMOTE_VERSION=$(get_remote_version)

if [ -z "$REMOTE_VERSION" ]; then
    echo -e "${RED}❌ No s'ha pogut obtenir la versió remota. Comprova la connexió a internet.${NC}"
    exit 1
fi

echo -e "${GREEN}   Última versió disponible: ${REMOTE_VERSION}${NC}"

# --------- COMPARAR VERSIONS ---------
if [ "$INSTALLED_VERSION" = "$REMOTE_VERSION" ]; then
    echo -e "\n${GREEN}✅ Discord ja està actualitzat! (v${INSTALLED_VERSION})${NC}"
    exit 0
fi

# --------- DESCARREGAR I INSTAL·LAR ---------
echo -e "\n${MAGENTA}⬇️  Descarregant Discord v${REMOTE_VERSION}...${NC}"
if ! curl -L -o "$DEB_FILE" "$DOWNLOAD_URL" 2>&1; then
    echo -e "${RED}❌ Error en la descàrrega.${NC}"
    exit 1
fi

echo -e "${MAGENTA}📦 Instal·lant Discord v${REMOTE_VERSION}...${NC}"
if sudo dpkg -i "$DEB_FILE"; then
    echo -e "${GREEN}✅ Discord actualitzat correctament! (v${REMOTE_VERSION})${NC}"
else
    echo -e "${YELLOW}⚠️  Resolent dependències...${NC}"
    sudo apt-get install -f -y
    if dpkg -s discord &>/dev/null; then
        echo -e "${GREEN}✅ Discord actualitzat correctament! (v${REMOTE_VERSION})${NC}"
    else
        echo -e "${RED}❌ Error en la instal·lació de Discord.${NC}"
        exit 1
    fi
fi

echo -e "\n${CYAN}=======================================================${NC}"
echo -e "${GREEN}   🎉 Procés completat amb èxit!${NC}"
echo -e "${CYAN}=======================================================${NC}"
