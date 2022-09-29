function nvim () {
    command nvim $@
    echo -ne '\x1b\x5b0\x20\x71'
}

function smbmount () {
    command mkdir -p /home/ulrich/shares/$1
    command sudo mount -t cifs -o username=ulrich.barnstedt //htldaten/$1 /home/ulrich/shares/$1
}

function ff () {
    command find . -maxdepth ${2:-3} -name "*${1}*"
}

function fcd () {
    dirName=$(find . -maxdepth ${2:-3} -type d -name "*${1}*" | head -1) 
   
    if [ -z "$dirName"  ] && [ -z "${2}" ]
    then 
        echo "Incrementing search depth ..."
        dirName=$(find . -maxdepth ${2:-6} -type d -name "*${1}*" | head -1) 
    fi
    
    if [ -z "$dirName" ] 
    then 
        echo "Not found"
    else
        command cd $dirName
    fi
}

function mac_steal () {
    sudo ip link set wlp62s0 down
    sudo macchanger --mac ${1} wlp62s0
    sudo ip link set wlp62s0 up
}

alias reset="echo -ne '\x1b\x5b0\x20\x71'"
alias ll="exa -la"
alias lsf="exa --group-directories-first -la"
alias lfs="exa --group-directories-first -la"
alias lsfs="exa --group-directories-first -la --no-user --no-permissions --no-time --no-filesize"
alias pls='sudo $(history -p !!)'
if [ "$TERM" = "xterm-256color" ]; then
    alias lg="ls -lah | lolcat -t"
else
    alias lg="ls -lah"
fi
alias tetris="bastet"
alias fartune="fortune | cowsay | lolcat -t"
alias ltree="exa -T -L 2"
alias lgtree="exa -T -L 2 | lolcat -t"
alias v="nvim"
alias alt="update-alternatives"
alias javac8a="find . -name *.java -print | xargs /usr/lib/jvm/java-8-openjdk-amd64/bin/javac"
alias update="sudo apt update && sudo apt upgrade -y && sudo snap refresh && flatpak update && rustup update && cargo install-update -a && brew update"
alias dndg="(cd ~/Programming/Projects/JS/dnd-cli && node index.js c)"
alias cp="cp -i"
alias ite_kb="ite8291r3-ctl"
alias mpvt="mpv --no-config --vo=tct "
export BAT_THEME="OneHalfDark"
export BAT_PAGER=""
