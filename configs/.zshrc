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
    javac *.java && java "$@"
    rm -f *.class
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