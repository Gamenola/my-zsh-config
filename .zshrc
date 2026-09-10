# History
HISTFILE=~/.zsh_history
HISTSIZE=20000
SAVEHIST=20000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt INC_APPEND_HISTORY_TIME

# Environment & Keybindings
export EDITOR="nano"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range :500 {}'"
bindkey -e

# Completion System
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Core Aliases
alias show='zi'
alias rb='reboot'
alias po='poweroff'
alias bios='sudo systemctl reboot --firmware-setup'
alias ff='fastfetch'
alias clear='clear && printf "\e[3J"'
alias cl='clear'
alias ls='eza --icons --group-directories-first'
alias ll='eza -lh --icons --group-directories-first'
alias la='eza -lah --icons --group-directories-first'
alias cat='bat --style=plain'
alias syu='yay -Syu'
alias clean='sudo pacman -Rns $(pacman -Qtdq) 2>/dev/null || echo "No orphaned packages found."'
alias ccache='yay -Sc'

# System & Maintenance Aliases
alias mirrors='sudo reflector --protocol https --latest 10 --sort rate --save /etc/pacman.d/mirrorlist'
alias open='xdg-open'

# Tools Initialization
eval "$(zoxide init zsh)"

[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

# Prompt
PROMPT='[%n@%m %1~]%# '

# Plugins
[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
