#!/usr/bin/env bash
# Author : Mossab Diae @MossabDiae
# Version : 0.1

function dirhistory () {
    # if not activated exit
    # Set per-directory env with direnv
    if [ "$DH_ACTIVE" != true ]; then
        return 0
    fi    
    setvars
    savelast
}

function setvars () {
    # check if env variables are set or set default
    # currently the script must find both of them or it'll set defaults
    # TODO: handle more senarios, error checking

    if [ -z "$DH_FILENAME" ] || [ -z "$DH_LOGDIR" ]; then
        # set defaults : current_dir/dir_history.txt
        # SECURITY WARNING: make sure to exclude .dir_history.txt from git
        # using .gitignore (see README).
        savename=.dir_history.txt
        savedir=$(pwd)
    else
        savename=$DH_FILENAME
        savedir=$DH_LOGDIR
    fi
    path=$savedir/$savename
}

function savelast () {
    # get last executed command
    last=$(fc -n -l -1 -1)
    if [ "$last" == "$old" ]; then
         return 0
    fi
    old=$last
    # save it
    echo "$last" >> $path
}

# integrate by overriding PROMPT command 
export PROMPT_COMMAND="dirhistory; ${PROMPT_COMMAND}"