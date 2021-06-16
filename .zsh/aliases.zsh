# Aliases

alias zshedit="vim ~/.zshrc"
alias zshload="source ~/.zshrc"
alias aliasedit="vim ~/.zsh/aliases.zsh"

alias vim="nvim"
# boost vim productivity by gpu terminal launch vim in a separate alacrity session
function vimd() { alacritty -e nvim "$@" & disown }

# dualshock gamepad
alias gamepad="sudo ds4drv" 

# dotfiles git alias
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias d="cd ~/Desktop"

# show temperature
alias temp="paste <(cat /sys/class/thermal/thermal_zone*/type) <(cat /sys/class/thermal/thermal_zone*/temp) | column -s $'\t' -t"

# translate in terminal
alias trans="gawk -f <(curl -Ls git.io/translate) -- -shell"

# robomongo
alias robo="QT_SCALE_FACTOR=1.2 /home/alex/Downloads/robo3t-1.2.1-linux-x86_64-3e50a65/bin/robo3t"

# database containers
alias mongo="docker run --rm -p 27017:27017 --name docker-mongo -v ~/.mongodb-data:/data/db mongo"

# GitKraken
alias krak="SHELL=/bin/bash /snap/bin/gitkraken"

# alias postgres="docker run --rm --name pg-docker -e POSTGRES_PASSWORD=postgres -p 5432:5432 -v $HOME/docker/volumes/postgres:/var/lib/postgresql/data postgres"
# alias psql="docker exec -it pg-docker psql -U postgres"

alias redis="docker run --rm --name redis-docker -p 6379:6379 -v $HOME/docker/volumes/redis:/data redis redis-server --appendonly yes"
alias redis-cli="docker exec -it redis-docker redis-cli"

alias datomic="docker run -e ADMIN_PASSWORD="admin" -e DATOMIC_PASSWORD="datomic" -p 4334-4336:4334-4336 --name datomic-free akiel/datomic-free"
