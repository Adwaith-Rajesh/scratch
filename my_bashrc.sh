parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export EDITOR=babi VISUAL=babi

trim_prompt=true

# a function to make and cd to a dir
mkcd () {
    mkdir "$1"
    cd "$1"
}

trim () {
    if [ "$trim_prompt" = true ]
    then
        PROMPT_DIRTRIM=1
        trim_prompt=false
    else
        PROMPT_DIRTRIM=10
        trim_prompt=true
    fi
}

# export PS1="\u@\h \[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]\n$ "
# export PROMPT_COMMAND='echo -ne "\033]0;$(basename "$(pwd)")\007"'
export PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[\e[31m\]\$(parse_git_branch)\[\e[00m\]\n$ "
export PATH=$PATH:/usr/local/go/bin
export PROMPT_COMMAND='echo -ne "\033]0;`pwd | rev | cut -d/ -f1 | rev`\007"'
# export PATH=$PATH:/home/adwaith/nim_bin/bin

# GO stuff
export GOROOT=/usr/local/go
export GOPATH=/home/adwaith/golib  # This is where all the my stuff is.
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/home/adwaith/.local/bin
export GOPATH=$GOPATH:/home/adwaith/gocode  # This where i write my code

# Python stuff
export PYTHONSTARTUP=~/.pythonrc.py
alias py=python3
alias pip3=pip-venv-sure

# Java Stuff
export J2SDKDIR=/usr/lib/jvm/jdk-18
export J2REDIR=/usr/lib/jvm/jdk-18
export PATH=$PATH:/usr/lib/jvm/jdk-18/bin:/usr/lib/jvm/jdk-18/db/bin
export JAVA_HOME=/usr/lib/jvm/jdk-18
export DERBY_HOME=/usr/lib/jvm/jdk-18/db

# other aliases
alias nano=babi
alias gti=git
alias virt="virtualenv env -p 3.9 && . env/bin/activate"
alias jn="jupyter notebook"
alias base=". /home/adwaith/base_env/bin/activate"
alias open=xdg-open
alias embystop="sudo systemctl disable emby-server.service"
alias embystart="sudo service emby-server start"

# initialize brew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# add /usr/bin to the PATH var
# export PATH=$PATH:/usr/bin

# luarocks bin folder
export PATH=$PATH:/home/adwaith/.luarocks/bin
export PATH=$PATH:/usr/share/texlive/texmf-dist/tex/xelatex

bind 'set bell-style none'
