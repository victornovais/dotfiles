# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
EDITOR=sublime
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="victornovais"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vitualenvwrapper git-flow github)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/i686-pc-linux-gnu/gcc-bin/4.5.3:/usr/i686-pc-linux-gnu/x86_64-pc-linux-gnu/gcc-bin/4.5.3:/usr/games/bin:/home/victornovais/src/less.js/bin/


autoload -U compinit promptinit
compinit
#ipromptinit; prompt gentoo

zstyle ':completion::complete:*' use-cache 1


function git_prompt_behind_develop(){
  if $(echo "$(git log HEAD..origin/develop 2> /dev/null)" | grep '^commit' &> /dev/null); then
    echo " [-$(git log --oneline HEAD..origin/develop 2> /dev/null | wc -l)]"
  fi
}

function git_prompt_ahead_develop(){
  if $(echo "$(git log origin/develop..HEAD 2> /dev/null)" | grep '^commit' &> /dev/null); then
    echo " [+$(git log --oneline origin/develop..HEAD 2> /dev/null | wc -l)]"
  fi
}

RPROMPT+='%{$RED%}$(git_prompt_behind_develop)%{$GREEN%}$(git_prompt_ahead_develop)%{$RESET_COLOR%}'

[[ -f /usr/bin/virtualenvwrapper.sh ]] && source /usr/bin/virtualenvwrapper.sh
# Debian-likes
[[ -f /usr/local/bin/virtualenvwrapper.sh ]] && source /usr/local/bin/virtualenvwrapper.sh


alias esync='sudo eix-sync '
alias eworld='sudo emerge -auDNv world'
alias esys='sudo emerge -auDNv system'
alias einst='sudo emerge'
alias efetch='sudo emerge -f'
alias eumask='sudo autounmask'
alias euinst='sudo emerge -C'
alias revdep='sudo revdep-rebuild'
alias flag='sudo flaggie'
alias etcupdate='sudo etc-update'
alias eq='equery '
alias py='ipython'
alias dfh='df -hP | sed -e "s/Sist. Arq./Sist.Arq./" | column -t'
alias gf='git flow'
alias wscan='sudo iwlist eth1 scan'
alias enews='eselect news'
alias ebelong='eq b'
alias edepend='eq d'
alias efiles='eq f'
alias ip='/sbin/ifconfig'

# Tmux aliases
alias tl='tmux ls'
alias ta='tmux attach -t'


[[ -a ~/.shell-extras ]] && . ~/.shell-extras

#Alias do Python, Django e etc
alias manage='python $VIRTUAL_ENV/manage.py'



