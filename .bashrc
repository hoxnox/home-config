export EDITOR=vim
alias mc='. /usr/libexec/mc/mc-wrapper.sh'
export PS1='\[\033[00;32m\]\w\[\033[00m\]\[\033[01;33m\]`git branch 2>/dev/null|cut -f2 -d\* -s`\[\033[00m\]\$ '
source /usr/share/bash-completion/git
