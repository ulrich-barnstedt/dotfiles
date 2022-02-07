function nvim () {
    command nvim $@
    echo -ne '\x1b\x5b0\x20\x71'
}

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
alias v="nvim"
alias alt="update-alternatives"
alias javac8a="find . -name *.java -print | xargs /usr/lib/jvm/java-8-openjdk-amd64/bin/javac"
