# Directory command history
(still work in progress)

## Why : 
When making a project for the first time with a new technology (e.g framework) you may want to save the commands you used during the project setup / workflow so you'll have easier time creating your next project . The idea is to make the re-learning experience more comfortable potentially giving confidence to start projects more often .

## How to use : 


## Warning : 


## Known problems:
- the script is late by one command , make sure to run one last ls before exiting the directory so the last meaningful command gets logged.
- if you're syncing history across multiple terminals (with `export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"`) interactions can happen (the last command you run in another terminal gets logged)

# Wish-list
- fix Known problems.
- better error checking for user input.