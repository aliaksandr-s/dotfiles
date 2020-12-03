# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

## Paths ##
# ZSH #
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CONFIG="$HOME/.zsh"

# Brew #
export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH

# Janet Lang packages #
export PATH=/home/linuxbrew/.linuxbrew/Cellar/janet/1.12.2/bin:$PATH

# IcedVim #
export PATH=~/.local/share/nvim/plugged/vim-iced/bin:$PATH


# term colors in tmux
export TERM=xterm-256color

## Themes ##
# ZSH_THEME="robbyrussell"
ZSH_THEME="spaceship"


## Plugins ##
plugins=(
  zsh-nvm
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)


## Sources ##
source $ZSH/oh-my-zsh.sh
source $ZSH_CONFIG/aliases.zsh
source $ZSH_CONFIG/funcs.zsh

## Config ##
eval $(thefuck --alias)
# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'


## FZF ##

# Enable a better reverse search experience.
#   Requires: https://github.com/junegunn/fzf (to use fzf in general)
#   Requires: https://github.com/BurntSushi/ripgrep (for using rg below)
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
