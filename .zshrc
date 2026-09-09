# --- History Configuration ---
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS          # Ignore duplicate commands in history
setopt HIST_IGNORE_SPACE         # Ignore commands starting with a space
setopt SHARE_HISTORY             # Share history across active shell sessions

# --- Environment & Keybindings ---
export EDITOR="nano"
bindkey -e                        # Standard Emacs keybindings

# --- Completion System ---
autoload -Uz compinit && compinit -i
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case-insensitive completion

# --- Core Aliases ---
alias ff='fastfetch'
alias clear='clear && printf "\e[3J"'
alias cl='clear && printf "\e[3J"'
alias ls='eza --icons --group-directories-first'
alias ll='eza -lh --icons --group-directories-first'
alias la='eza -lah --icons --group-directories-first'
alias cat='bat --style=plain'
alias syu='yay -Syu'
alias clean='sudo pacman -Rns $(pacman -Qtdq) 2>/dev/null || echo "No orphaned packages found."'

# --- System & Maintenance Aliases ---
alias mirrors='sudo reflector --protocol https --latest 10 --sort rate --save /etc/pacman.d/mirrorlist'
alias open='xdg-open'

# --- Tools Initialization ---
# Zoxide (Smart cd)
eval "$(zoxide init zsh)"

# FZF Integration
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

# --- Prompt ---
PROMPT='[%n@%m %1~]%# '

# --- Plugins (Must stay at the bottom) ---
[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
