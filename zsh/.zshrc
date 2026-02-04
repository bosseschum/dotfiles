# .zshrc - Fish-inspired zsh configuration
# ========================================
#
# Run Fastfetch
if [[ -o interactive ]]; then
    fastfetch
fi

# History configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY              # Share history across all sessions
setopt HIST_IGNORE_ALL_DUPS       # Remove older duplicate entries from history
setopt HIST_REDUCE_BLANKS         # Remove superfluous blanks from history items
setopt HIST_VERIFY                # Show command with history expansion before running it
setopt INC_APPEND_HISTORY         # Add commands to history immediately

# Directory navigation (Fish-like)
setopt AUTO_CD                    # Auto cd when typing just a directory name
setopt AUTO_PUSHD                 # Push directories onto the directory stack
setopt PUSHD_IGNORE_DUPS          # Don't push duplicates
setopt PUSHD_SILENT               # Don't print directory stack after pushd/popd

# Completion system
autoload -Uz compinit
compinit

# Fish-like completion features
setopt COMPLETE_IN_WORD           # Complete from both ends of a word
setopt ALWAYS_TO_END              # Move cursor to end if word had one match
setopt AUTO_MENU                  # Show completion menu on successive tab press
setopt AUTO_LIST                  # Automatically list choices on ambiguous completion
setopt MENU_COMPLETE              # Auto-insert first completion match immediately
unsetopt FLOW_CONTROL             # Disable start/stop characters (^S/^Q)

# Case-insensitive completion (like Fish)
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# Colorful completion menu
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Better completion descriptions
zstyle ':completion:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{red}-- no matches found --%f'

# Group completions by category
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:-command-:*:*' group-order alias builtins functions commands

# Fish-like syntax highlighting (requires zsh-syntax-highlighting plugin)
# Install: git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
if [[ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source ~/.zsh/zsh-syntax-highlighting/themes/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh
fi

# Fish-like autosuggestions (requires zsh-autosuggestions plugin)
# Install: git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
if [[ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
    ZSH_AUTOSUGGEST_STRATEGY=(history completion)
    ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
fi

# Starship prompt
eval "$(starship init zsh)"

# Nicer ls colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Common aliases
alias ls='ls --color=auto 2>/dev/null || ls -G'
alias ll='ls -lh'
alias la='ls -lAh'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Git aliases (popular in Fish configs)
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'
alias gd='git diff'

# User aliases
alias aur='paru -Ss'
alias cat='bat'
alias i='paru -S'
alias tanim='~/.config/hypr/scripts/toggle-animations.sh'

# Fish-like command-not-found handler
if [[ -f /etc/zsh_command_not_found ]]; then
    source /etc/zsh_command_not_found
fi

# Enhanced cd (Fish-like directory jumping)
# This allows you to jump to subdirectories without typing full path
# e.g., "cd project" from anywhere to jump to ~/dev/project
setopt AUTO_NAME_DIRS

# Key bindings (Fish-like behavior)
bindkey '^[[A' history-beginning-search-backward  # Up arrow
bindkey '^[[B' history-beginning-search-forward   # Down arrow
bindkey '^[[3~' delete-char                       # Delete key
bindkey '^[[H' beginning-of-line                  # Home key
bindkey '^[[F' end-of-line                        # End key
bindkey '^[[1;5C' forward-word                    # Ctrl+Right
bindkey '^[[1;5D' backward-word                   # Ctrl+Left

# Accept autosuggestion with Ctrl+Space or End key (Fish-like)
if [[ -n "$ZSH_AUTOSUGGEST_ACCEPT" ]]; then
    bindkey '^ ' autosuggest-accept               # Ctrl+Space
    bindkey '^[[F' autosuggest-accept             # End key (alternative)
fi

# Edit command line in editor (Ctrl+X Ctrl+E)
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

# Useful functions

# mkdir and cd into it (Fish has this built-in as "mkdir -p foo; cd foo")
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Extract any archive type
extract() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"    ;;
            *.tar.gz)    tar xzf "$1"    ;;
            *.bz2)       bunzip2 "$1"    ;;
            *.rar)       unrar x "$1"    ;;
            *.gz)        gunzip "$1"     ;;
            *.tar)       tar xf "$1"     ;;
            *.tbz2)      tar xjf "$1"    ;;
            *.tgz)       tar xzf "$1"    ;;
            *.zip)       unzip "$1"      ;;
            *.Z)         uncompress "$1" ;;
            *.7z)        7z x "$1"       ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Quick find
f() {
    find . -iname "*$1*"
}

# Configure .dotfiles
config() {
    if [[ -z "$1" ]]; then
        nvim ~/.config/
    elif [[ "$1" == /* ]]; then
        nvim "$1"
    else
        local found=($(find ~/.config/ -name "$1" -type f 2>/dev/null))
        
        if [[ ${#found[@]} -eq 0 ]]; then
            nvim ~/.config/"$1"
        elif [[ ${#found[@]} -eq 1 ]]; then
            nvim "$found[1]"
        else
            local selected=$(printf '%s\n' "${found[@]}" | fzf)
            [[ -n "$selected" ]] && nvim "$selected"
        fi
    fi
}

# Performance: Load completions only once
# (Fish does this automatically)
autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
    compinit
else
    compinit -C
fi

# Path additions (customize to your needs)
# export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init - zsh)"

# Language/Tool specific (uncomment as needed)
export EDITOR='nvim'
export VISUAL='nvim'

# Node.js (nvm, if installed)
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Python (pyenv, if installed)
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

# Ruby (rbenv, if installed)
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"

# Rust
# export PATH="$HOME/.cargo/bin:$PATH"

# Go
# export GOPATH="$HOME/go"
# export PATH="$PATH:$GOPATH/bin"

# Load local customizations (like Fish's conf.d)
if [[ -f ~/.zshrc.local ]]; then
    source ~/.zshrc.local
fi

# Fish-like greeting (optional - comment out if you don't want it)
# echo "Welcome to zsh! Type 'alias' to see available shortcuts."
