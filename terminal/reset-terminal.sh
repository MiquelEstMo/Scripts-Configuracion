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

echo -e "${RED}__________ __________  _________  _______________${NC}"
echo -e "${YELLOW}\____    \\\\  ____/  /_|   _____/  |    \\_   _____/${NC}"
echo -e "${GREEN}  /     / \\  ___/\\  __\\  \\____   |    | |   __)_ ${NC}"
echo -e "${CYAN} /     /_  \\  \\   \\|  | /       \\ |    | |        \\${NC}"
echo -e "${MAGENTA}/_______ \\  \\__\\   \\__|/______  /______//_______  /${NC}"
echo -e "${BLUE}        \\/     \\/             \\/               \\/ ${NC}"
echo
echo -e "${CYAN}=======================================================${NC}"
echo -e "${YELLOW}         Terminal Reset - Volver a Bash Original${NC}"
echo -e "${CYAN}=======================================================${NC}"

echo -e "\n${MAGENTA}🔄 Resetejant terminal a l'estat original${NC}"

# ------------------------ BANNER ------------------------

# Function to ask for confirmation
confirm() {
    while true; do
        read -p "$(echo -e "${YELLOW}❓ $1 [y/N]: ${NC}")" yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* | "" ) return 1;;
            * ) echo -e "${RED}⚠️  Si us plau, respon amb 'y' o 'n'.${NC}";;
        esac
    done
}

# --------- BACKUP DE CONFIGURACIONS ACTUALS ---------

echo -e "\n${BLUE}💾 Creant backup de configuracions actuals...${NC}"

# Create backup directory
BACKUP_DIR="$HOME/terminal_backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

# Backup current configurations
if [ -f "$HOME/.bashrc" ]; then
    cp "$HOME/.bashrc" "$BACKUP_DIR/.bashrc.backup"
    echo -e "${CYAN}📋 Backup de .bashrc creat${NC}"
fi

if [ -f "$HOME/.zshrc" ]; then
    cp "$HOME/.zshrc" "$BACKUP_DIR/.zshrc.backup"
    echo -e "${CYAN}📋 Backup de .zshrc creat${NC}"
fi

if [ -d "$HOME/.oh-my-zsh" ]; then
    cp -r "$HOME/.oh-my-zsh" "$BACKUP_DIR/oh-my-zsh.backup"
    echo -e "${CYAN}📋 Backup complet de .oh-my-zsh creat${NC}"
fi

echo -e "${GREEN}✅ Backups creats a: $BACKUP_DIR${NC}"

# --------- BACKUP DE CONFIGURACIONS ACTUALS ---------

# --------- MOSTRAR ESTAT ACTUAL ---------

echo -e "\n${BLUE}📊 Estat actual del terminal:${NC}"
echo -e "${CYAN}🐚 Shell actual: ${YELLOW}$SHELL${NC}"
echo -e "${CYAN}🐚 Shell per defecte: ${YELLOW}$(getent passwd $USER | cut -d: -f7)${NC}"

if [ -d "$HOME/.oh-my-zsh" ]; then
    echo -e "${CYAN}📦 Oh My Zsh: ${RED}INSTAL·LAT${NC}"
    
    # Check for specific plugins
    if [ -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
        echo -e "${CYAN}   └─ zsh-autosuggestions: ${RED}INSTAL·LAT${NC}"
    fi
    if [ -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
        echo -e "${CYAN}   └─ zsh-syntax-highlighting: ${RED}INSTAL·LAT${NC}"
    fi
    if [ -d "$HOME/.oh-my-zsh/custom/plugins/OhMyZsh-full-autoupdate" ]; then
        echo -e "${CYAN}   └─ OhMyZsh-full-autoupdate: ${RED}INSTAL·LAT${NC}"
    fi
else
    echo -e "${CYAN}📦 Oh My Zsh: ${GREEN}NO INSTAL·LAT${NC}"
fi

if command -v zsh >/dev/null 2>&1; then
    echo -e "${CYAN}📦 Zsh: ${RED}INSTAL·LAT${NC} ($(zsh --version | cut -d' ' -f2))"
else
    echo -e "${CYAN}📦 Zsh: ${GREEN}NO INSTAL·LAT${NC}"
fi

# --------- MOSTRAR ESTAT ACTUAL ---------

# --------- RESETEAR SHELL A BASH ---------

echo -e "\n${MAGENTA}🔄 Canviant shell per defecte a bash...${NC}"

# Check if already using bash
CURRENT_SHELL=$(getent passwd $USER | cut -d: -f7)
BASH_PATH=$(which bash)

if [ "$CURRENT_SHELL" = "$BASH_PATH" ]; then
    echo -e "${GREEN}✅ Ja estàs utilitzant bash com a shell per defecte${NC}"
else
    if confirm "Vols canviar el shell per defecte a bash?"; then
        chsh -s "$BASH_PATH"
        echo -e "${GREEN}✅ Shell canviat a bash. Reinicia la sessió per aplicar els canvis.${NC}"
    else
        echo -e "${YELLOW}⏭️  Mantenint shell actual${NC}"
    fi
fi

# --------- RESETEAR SHELL A BASH ---------

# --------- ELIMINAR CONFIGURACIONS ZSH I PLUGINS ---------

if [ -d "$HOME/.oh-my-zsh" ] || [ -f "$HOME/.zshrc" ]; then
    echo -e "\n${MAGENTA}🗑️  Eliminant configuracions de Zsh i plugins...${NC}"
    
    if confirm "Vols eliminar Oh My Zsh i TOTS els plugins personalitzats?"; then
        
        # Remove specific plugins first (for confirmation)
        echo -e "${YELLOW}🔍 Eliminant plugins específics...${NC}"
        
        if [ -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
            rm -rf "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
            echo -e "${GREEN}   ✅ zsh-autosuggestions eliminat${NC}"
        fi
        
        if [ -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
            rm -rf "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
            echo -e "${GREEN}   ✅ zsh-syntax-highlighting eliminat${NC}"
        fi
        
        if [ -d "$HOME/.oh-my-zsh/custom/plugins/OhMyZsh-full-autoupdate" ]; then
            rm -rf "$HOME/.oh-my-zsh/custom/plugins/OhMyZsh-full-autoupdate"
            echo -e "${GREEN}   ✅ OhMyZsh-full-autoupdate eliminat${NC}"
        fi
        
        # Remove any other custom plugins
        if [ -d "$HOME/.oh-my-zsh/custom/plugins" ]; then
            for plugin in "$HOME/.oh-my-zsh/custom/plugins"/*; do
                if [ -d "$plugin" ]; then
                    plugin_name=$(basename "$plugin")
                    rm -rf "$plugin"
                    echo -e "${GREEN}   ✅ Plugin personalitzat eliminat: ${plugin_name}${NC}"
                fi
            done
        fi
        
        # Remove custom themes if any
        if [ -d "$HOME/.oh-my-zsh/custom/themes" ]; then
            rm -rf "$HOME/.oh-my-zsh/custom/themes"
            echo -e "${GREEN}   ✅ Temes personalitzats eliminats${NC}"
        fi
        
        # Remove complete Oh My Zsh directory
        if [ -d "$HOME/.oh-my-zsh" ]; then
            rm -rf "$HOME/.oh-my-zsh"
            echo -e "${GREEN}✅ Oh My Zsh completament eliminat${NC}"
        fi
        
        # Remove .zshrc files
        if [ -f "$HOME/.zshrc" ]; then
            rm -f "$HOME/.zshrc"
            echo -e "${GREEN}✅ .zshrc eliminat${NC}"
        fi
        
        if [ -f "$HOME/.zshrc.pre-oh-my-zsh" ]; then
            rm -f "$HOME/.zshrc.pre-oh-my-zsh"
            echo -e "${GREEN}✅ .zshrc.pre-oh-my-zsh eliminat${NC}"
        fi
        
        # Remove zsh-specific directories that might remain
        if [ -d "$HOME/.zsh" ]; then
            rm -rf "$HOME/.zsh"
            echo -e "${GREEN}✅ Directori .zsh eliminat${NC}"
        fi
        
    else
        echo -e "${YELLOW}⏭️  Mantenint configuracions de Zsh${NC}"
    fi
fi

# --------- ELIMINAR CONFIGURACIONS ZSH I PLUGINS ---------

# --------- DESINSTALAR ZSH (OPCIONAL) ---------

if command -v zsh >/dev/null 2>&1; then
    echo -e "\n${MAGENTA}🗑️  Zsh està instal·lat al sistema${NC}"
    
    if confirm "Vols desinstal·lar Zsh completament del sistema?"; then
        # Detect package manager and uninstall accordingly
        if command -v apt-get >/dev/null 2>&1; then
            sudo apt-get remove --purge zsh -y
            sudo apt-get autoremove -y
        elif command -v yum >/dev/null 2>&1; then
            sudo yum remove zsh -y
        elif command -v dnf >/dev/null 2>&1; then
            sudo dnf remove zsh -y
        elif command -v pacman >/dev/null 2>&1; then
            sudo pacman -Rs zsh
        fi
        echo -e "${GREEN}✅ Zsh desinstal·lat del sistema${NC}"
    else
        echo -e "${YELLOW}⏭️  Mantenint Zsh instal·lat (però no s'utilitzarà)${NC}"
    fi
fi

# --------- DESINSTALAR ZSH (OPCIONAL) ---------

# --------- RESETEAR BASHRC A ORIGINAL ---------

echo -e "\n${MAGENTA}🔧 Resetejant .bashrc a configuració original...${NC}"

if confirm "Vols resetear .bashrc a la configuració per defecte del sistema?"; then
    if [ -f "/etc/skel/.bashrc" ]; then
        cp "/etc/skel/.bashrc" "$HOME/.bashrc"
        echo -e "${GREEN}✅ .bashrc resetejat a configuració per defecte${NC}"
    else
        # Create a basic .bashrc if /etc/skel/.bashrc doesn't exist
        cat > "$HOME/.bashrc" << 'EOF'
# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='\u@\h:\w\$ '
fi
unset color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
EOF
        echo -e "${GREEN}✅ .bashrc creat amb configuració bàsica${NC}"
    fi
else
    echo -e "${YELLOW}⏭️  Mantenint .bashrc actual${NC}"
fi

# --------- RESETEAR BASHRC A ORIGINAL ---------

# --------- LIMPIAR HISTORIAL (OPCIONAL) ---------

echo -e "\n${MAGENTA}🧹 Neteja d'historial...${NC}"

if confirm "Vols netejar l'historial de comandes?"; then
    # Clear bash history
    history -c
    rm -f "$HOME/.bash_history"
    
    # Clear zsh history if exists
    rm -f "$HOME/.zsh_history"
    rm -f "$HOME/.zhistory"
    
    echo -e "${GREEN}✅ Historial netejat${NC}"
else
    echo -e "${YELLOW}⏭️  Mantenint historial actual${NC}"
fi

# --------- LIMPIAR HISTORIAL (OPCIONAL) ---------

# --------- NETEJA ADDICIONAL ---------

echo -e "\n${MAGENTA}🧹 Neteja addicional de fitxers relacionats amb Zsh...${NC}"

# Remove any remaining zsh-related files
rm -f "$HOME/.zcompdump"*
rm -f "$HOME/.zsh_sessions"
rm -f "$HOME/.lesshst"

# Remove any zsh cache directories
if [ -d "$HOME/.cache/zsh" ]; then
    rm -rf "$HOME/.cache/zsh"
    echo -e "${GREEN}✅ Cache de Zsh eliminat${NC}"
fi

# --------- NETEJA ADDICIONAL ---------

# --------- RESUM FINAL ---------

echo -e "\n${GREEN}🎉 Reset del terminal completat!${NC}"
echo -e "\n${CYAN}📋 Resum de canvis:${NC}"
echo -e "${BLUE}   • Shell canviat a bash${NC}"
echo -e "${BLUE}   • Oh My Zsh completament eliminat${NC}"
echo -e "${BLUE}   • Tots els plugins eliminats:${NC}"
echo -e "${BLUE}     └─ zsh-autosuggestions${NC}"
echo -e "${BLUE}     └─ zsh-syntax-highlighting${NC}"
echo -e "${BLUE}     └─ OhMyZsh-full-autoupdate${NC}"
echo -e "${BLUE}   • Configuracions de Zsh eliminades${NC}"
echo -e "${BLUE}   • .bashrc resetejat${NC}"
echo -e "${BLUE}   • Cache i fitxers temporals netejats${NC}"
echo -e "${BLUE}   • Backup creat a: ${YELLOW}$BACKUP_DIR${NC}"

echo -e "\n${YELLOW}🔄 Per aplicar tots els canvis completament:${NC}"
echo -e "${CYAN}   1. Tanca totes les terminals obertes${NC}"
echo -e "${CYAN}   2. Fes logout i login de nou${NC}"
echo -e "${CYAN}   3. O reinicia el sistema${NC}"

echo -e "\n${MAGENTA}💡 Si vols recuperar alguna configuració, els backups estan a:${NC}"
echo -e "${YELLOW}   $BACKUP_DIR${NC}"

echo -e "\n${GREEN}🔍 Per verificar que tot s'ha eliminat correctament:${NC}"
echo -e "${CYAN}   ls -la ~/ | grep -E '(zsh|oh-my)'${NC}"

# --------- RESUM FINAL ---------