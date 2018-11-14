# Example aliases
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias zshconfig="code ~/.zshrc"
alias zshload="source ~/.zshrc"
alias aliasedit="nvim ~/.zsh/aliases.zsh"

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias d="cd ~/Desktop" 

# show temperature
alias temp="paste <(cat /sys/class/thermal/thermal_zone*/type) <(cat /sys/class/thermal/thermal_zone*/temp) | column -s $'\t' -t"

# translate in terminal
alias trans="gawk -f <(curl -Ls git.io/translate) -- -shell"

# robomongo
alias robo="QT_SCALE_FACTOR=1.2 /home/alex/Downloads/robo3t-1.2.1-linux-x86_64-3e50a65/bin/robo3t"

alias mongo="docker run --rm -p 27017:27017 --name docker-mongo -v ~/.mongodb-data:/data/db mongo"
