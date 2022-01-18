# Directory command history
(still work in progress)

## Why : 
When making a project for the first time with a new technology (e.g framework) you may want to save the commands you used during the project setup / workflow so you'll have easier time remembering how you did it when creating the next project . The idea is to make the re-learning experience more comfortable potentially giving confidence to start projects more often .
This project aims to automate saving commands run while inside a specific directory to an external file (no effect on the main history)

## How does it work : 
Before each prompt, dirhistory checks if the environment variable `DH_ACTIVE` is set to `true`, if so, it logs the last executed command into a file .
The file name and location can be set using the env variables `DH_FILENAME` and `DH_LOGDIR` respectively , if not found it default to `./.dir_history.txt`

dirhistory relies on [direnv](https://github.com/direnv/direnv) to set the environments variables (`DH_ACTIVE`,`DH_LOGDIR`, `DH_FILENAME`) based on the current directory.

## Warning : 


## Known problems:
- the script is late by one command , make sure to run one last ls before exiting the directory so the last meaningful command gets logged.
- if you're syncing history across multiple terminals (with `export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"`) interactions can happen (the last command you run in another terminal gets logged)

# Wish-list
- fix Known problems.
- better error checking for user input.
- support other shells.