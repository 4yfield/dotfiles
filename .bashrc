

# used by ps1 in tmux.conf
function battery_checker()
{
    # osx only will add linux later
    system_profiler SPPowerDataType | grep 'Cycle Count' | awk '{print $3}'
}

# with rvm
export WORKON_HOME=$HOME/.virtualenvs
mkdir -p $WORKON_HOME
source /usr/bin/virtualenvwrapper.sh

# check for autoload virtualenv
function __check_virtualenv() {
    if [ -e .venv ]; then
        env=$(cat .venv)
        if [ "$env" != "${VIRTUAL_ENV##*/}" ]; then
            echo "Found .venv in directory. Calling: workon ${env}"
            workon $env
            PS1="\[[1;33;44m\] $(basename $VIRTUAL_ENV) \[[m\] $_OLD_VIRTUAL_PS1"
        fi
    fi
}

[[ " ${chpwd_functions[*]} " == *" __check_virtualenv "* ]] ||
  chpwd_functions=( "${chpwd_functions[@]}" __check_virtualenv )



## without rvm
#export WORKON_HOME=$HOME/.virtualenvs
#mkdir -p $WORKON_HOME
#source /usr/bin/virtualenvwrapper.sh
#
## check for autoload virtualenv
#function __check_virtualenv() {
#    if [ -e .venv ]; then
#        env=$(cat .venv)
#        if [ "$env" != "${VIRTUAL_ENV##*/}" ]; then
#            echo "Found .venv in directory. Calling: workon ${env}"
#            workon $env
#            PS1="\[[1;33;44m\] $(basename $VIRTUAL_ENV) \[[m\] $_OLD_VIRTUAL_PS1"
#        fi
#    fi
#}
#
## change cd command
## rvm blows this away
#function venv_cd () {
#    builtin cd "$@" && check_virtualenv
#}
#alias cd="venv_cd"
