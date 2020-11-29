# zmodload zsh/zprof # <- This will load the profiler tool for ZSH. Need zprof at the end of this file as well.

bindkey -v 							# Use Vi mode

# Setup aliases
alias l='ls -l'
alias la='ls -a'
alias ltra='ls -ltra'

BASE16_SHELL="$HOME/.config/base16-shell/"			# Base16 Shell
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

export PATH="/usr/local/opt/curl/bin:$PATH"			# Use Homebrew version of CURL
export EDITOR="nvim"

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

# Set theme
setopt promptsubst
zinit light agnoster/agnoster-zsh-theme

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#
# zprof # <- Display profile information (see line 1)
