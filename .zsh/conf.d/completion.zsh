# ==================
#     Completion
# ==================
autoload -U compinit
#compinit
autoload zed
# Verbose
#zstyle ':completion:*' verbose yes
#zstyle ':completion:*:descriptions' format '%B%d%b'
#zstyle ':completion:*:messages' format '%d'
#zstyle ':completion:*:warnings' format 'No matches for: %d'
#zstyle ':completion:*' group-name ''

#autoload -Uz colors
#colors
setopt prompt_subst


# show packed completion list
setopt list_packed

#autoload predict on

compdef -d git
compdef -d tmux
compdef -d pacman
compdef -d gradle
compdef -d npm
compdef -d scp
