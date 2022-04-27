function nvim () {
    command nvim $@
    echo -ne '\x1b\x5b0\x20\x71'
}

function smbmount () {
    command mkdir -p /home/ulrich/shares/$1
    command sudo mount -t cifs -o username=ulrich.barnstedt //htldaten/$1 /home/ulrich/shares/$1
}

alias ll="ls -lah"
alias lsf="exa --group-directories-first -la"
alias lsfs="exa --group-directories-first -la --no-user --no-permissions --no-time --no-filesize"
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
alias update="cargo install-update -a && sudo apt update && sudo snap refresh"
alias dndg="(cd ~/Programming/Projects/JS/dnd-cli && node index.js c)"
