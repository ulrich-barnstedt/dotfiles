alias ll="ls -lah"
alias pls='sudo $(history -p !!)'
if [ "$TERM" = "xterm-256color" ]; then
    alias lg="ls -lah | lolcat -t"
else
    alias lg="ls -lah"
fi
alias tetris="bastet"
alias fartune="fortune | cowsay | lolcat -t"
alias ltree="tree -L 2"
alias lgtree="tree -L 2 | lolcat -t"
alias nvim="nvim && echo -ne '\x1b\x5b0\x20\x71'"
alias v="nvim"
