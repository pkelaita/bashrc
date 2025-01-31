RED="\\[\\033[31m\\]"
GREEN="\\[\\033[32m\\]"
YELLOW="\\[\\033[33m\\]"
BLUE="\\[\\033[1;34m\\]"
CYAN="\\[\\033[1;36m\\]"
MAGENTA="\\[\\033[35m\\]"
WHITE="\\[\\033[0m\\]"

# preserves true alphanumeric sorthing (for Linux, anyway)
# export LC_COLLATE=C

# export PS1="$CYAN\h:$YELLOW\$(parse_git_branch) $MAGENTA\w $RED\!$ $WHITE"
export PS1="$CYAN\h:$MAGENTA\w $RED\!$ $WHITE"
if [ `whoami` == "root" ]; then
	export PS1='ROOT \[\033[07;00;36m\]\H\[\033[m\]:\[\033[00;35m\]\w\[\033[m\] ROOT \!$ '
fi

# Configs
alias brc="vim ~/.bashrc"
alias brcc="source ~/.bashrc"
alias grc="vim ~/.config/ghostty/config"

# Git
alias gits="grep -iE '^alias .*git ' ~/.bashrc | grep -v 'alias gits=' | sed 's/^alias //'"
alias gl="git log --oneline -n 25"
alias gs="git status"
alias gd="git diff"
alias ga="git add ."
alias gm="git commit -m "
alias gp="git push"
alias gb="git branch"
alias gc="git checkout"
alias gr="git restore --staged"
alias gi='f() { git rebase -i HEAD~$1; unset -f f; }; f' # interactive rebase
alias gre="git rebase"
alias gam="git commit --amend"
alias gbc="git branch --merged | grep -v '\*' | xargs -n 1 git branch -d" # branch cleanup
alias gpf="git push --force"
alias gst="git stash"
alias gsl="git stash list"
alias gsp="git stash pop"
alias gsa="git stash apply"
alias gsd="git stash drop"

# Python
alias ve="source venv/bin/activate"
alias vv="python3 -m venv venv"
alias python="python3"
alias pclear="pip freeze | xargs pip uninstall -y"

# Docker
alias ds="open -a Docker"
alias dc="docker compose"
alias dsp="docker system prune -a"

# Web Dev
alias shad="pnpm dlx shadcn@latest"
alias sinit="pnpm dlx shadcn@latest init --src-dir"
alias mf="make fix"

# Applications
alias mdb='/usr/local/bin/mongod --dbpath ~/data/db'
alias code='open -b com.microsoft.VSCode "$@"' # https://github.com/microsoft/vscode/issues/60579
alias c="cursor ."
alias 1p="op" # 1Password

# Misc
alias path="sed 's/:/\n/g' <<< \"$PATH\""
alias rm='rm -i' # protect from accidental deletion
alias clearcache='read -p "Confirm (y/n): " confirm && [ "$confirm" = "y" ] && sudo rm -rf ~/Library/Caches/* /Library/Caches/*'
alias ttr="tput rmam"
alias tts="tput smam"
alias make='make -j $(sysctl -n hw.logicalcpu)' # Parallelize make

# Copies the output of $0, or of the previous command if not given
yank() {
    if [ $# -eq 0 ]; then
        fc -ln -1 | bash | awk '{printf "%s", $0}' | pbcopy
    else
        "$@" | awk '{printf "%s", $0}' | pbcopy
    fi
}

