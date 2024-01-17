# zmodload zsh/zprof # <- This will load the profiler tool for ZSH. Need zprof at the end of this file as well.

bindkey -v 							# Use Vi mode

# Setup aliases
# alias ls='exa'
alias l='ls -l'
alias la='ls -a'
alias lsltm='ls -lt modified'
alias lsltc='ls -lt created'

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        source "$BASE16_SHELL/profile_helper.sh"

export PATH="/usr/local/opt/curl/bin:$PATH"			# Use Homebrew version of CURL
export EDITOR="nvim"

# ASDF version manager
. /usr/local/opt/asdf/libexec/asdf.sh
export PATH="$PATH:$(yarn global bin)"              # Add asdf global yarn bin to PATH

# Utility scripts go here and are on the PATH
[ -d $HOME/scripts ] && export PATH="$PATH:$HOME/scripts"

## Check the admin scripts are installed in add to PATH
[ -d $HOME/Developer/au-admin-scripts/scripts/release ] && export PATH="$PATH:$HOME/Developer/au-admin-scripts/scripts/release"

# Rust
export PATH="$PATH:/Users/trrop/.asdf/installs/rust/1.68.2/bin"

# Local executables/binaries
export PATH="$PATH:/Users/trrop/.local/bin"

export PATH="/usr/local/opt/sqlite/bin:$PATH"

# Enable opening command in $EDITOR
# # Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

# Zinit - Auto-suggest, syntax highlighting, completions
zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" \
      zdharma/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
      zsh-users/zsh-completions

# Zinit - Dir colours
zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zinit light trapd00r/LS_COLORS

# JQ interactive query tool
zinit light 'reegnz/jq-zsh-plugin'

# Zinit - fzf-tab: completions using fzf
zinit light Aloxaf/fzf-tab
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'
# zsh-fzf-history-search
zinit ice lucid wait'0'
zinit light joshskidmore/zsh-fzf-history-search

# Set theme
setopt promptsubst
zinit light agnoster/agnoster-zsh-theme

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#

# JDK version
. ~/.asdf/plugins/java/set-java-home.zsh

# https://github.com/rupa/z
# Trying out zoxide instead
# . /usr/local/etc/profile.d/z.sh
eval "$(zoxide init zsh)"

# Load starship prompt
# eval "$(starship init zsh)"

# zprof # <- Display profile information (see line 1)


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

