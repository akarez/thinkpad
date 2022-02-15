# Export Default Programs

export EDITOR=nvim
export BROWSER=firefox

# If not running interactively, don't do anything

[[ $- != *i* ]] && return

#Commands

alias ls='ls --color=auto'
alias v='nvim'

#Config Shortcuts

alias bc='nvim ~/.config/bspwm/bspwmrc'
alias sc='nvim ~/.config/sxhkd/sxhkdrc'
alias ac='nvim ~/.config/alacritty/alacritty.yml'
alias pc='nvim ~/.config/polybar/config'

#Remove User and Machine from console

PS1="\W \$ "
