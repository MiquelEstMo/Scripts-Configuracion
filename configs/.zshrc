# =============================================================================
# CONFIGURACIO DEL PATH
# =============================================================================

# Afegeix directoris basics al PATH
export PATH="$HOME/.local/bin:$PATH"

# =============================================================================
# CONFIGURACIO D'OH MY ZSH
# =============================================================================

# Ruta d'instal.lacio d'Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# Tema visual
ZSH_THEME="awesomepanda"

# Configuracio d'actualitzacions automatiques
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 13

# =============================================================================
# PLUGINS
# =============================================================================

plugins=(
    git                    # Comandes i aliases per a Git
    zsh-autosuggestions    # Suggeriments de comandes basades en l'historial
    zsh-syntax-highlighting # Ressaltat de sintaxi per a comandes
    you-should-use         # Recordatoris d'aliases alternatius
)

# Carrega la configuracio d'Oh My Zsh
source $ZSH/oh-my-zsh.sh

# =============================================================================
# ALIASES PERSONALS
# =============================================================================

# Gestio de configuracio
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"

# Comandes del sistema amb colors
alias ls='colorls'
alias la='colorls -A'
alias ll='colorls -lA'
alias tree='colorls --tree'

# Misc alias
alias ytdl='yt-dlp -f "bestvideo[height<=1080]+bestaudio" --merge-output-format mp4 -o "~/Videos/%(title)s.%(ext)s"'

# Actualitzacio completa del sistema (dnf + flatpak + discord)
sysupdate() {
    sudo dnf upgrade -y
    flatpak update -y
    ~/Documents/Programació/Scripts-Configuracion/apps/discord.sh
}

# =============================================================================
# FUNCIONS PERSONALITZADES
# =============================================================================

# Activacio automatica d'entorns virtuals Python
cd() {
    builtin cd "$@"
    
    # Desactivar entorn anterior si n'hi ha
    if [[ -n "$VIRTUAL_ENV" ]]; then
        deactivate 2>/dev/null
    fi
    
    # Activar nou entorn si existeix
    if [[ -d .venv ]]; then
        source .venv/bin/activate
    fi
}

# Compilacio i execucio rapida de Java
jrun() {
    # Verificar archivos .java
    ls *.java &>/dev/null || { echo "Error: No hay archivos .java"; return 1; } 
    # Buscar paquete
    local pkg=$(grep -h "^package " *.java 2>/dev/null | head -1 | sed 's/package //;s/;//;s/ //g')
    if [ -n "$pkg" ]; then
        # Con paquete: subir niveles necesarios
        local levels=$(echo "$pkg" | tr -cd '.' | wc -c)
        local backup=$(pwd)
        for ((i=0; i<=levels; i++)); do cd ..; done
        javac ${pkg//.//}/*.java && java ${pkg}.${1%.java} && rm -f ${pkg//.//}/*.class
        cd "$backup"
    else
        # Sin paquete
        javac *.java && java ${1%.java} && rm -f *.class
    fi
}

# =============================================================================
# AUTOCOMPLETAT
# =============================================================================

# Autocompletat per Java
compdef '_files -g "*.java"' java
compdef '_files -g "*.class"' java

# =============================================================================
# EINES EXTERNES
# =============================================================================

# Gestor d'entorns mise
eval "$(~/.local/bin/mise activate zsh)"

# Prompt personalitzat Starship
eval "$(starship init zsh)"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# =======================================
# MOTD
# =======================================
/usr/local/bin/my-motd