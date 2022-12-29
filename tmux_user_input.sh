#!/bin/bash

#ask if user wants to customize Sess & windows
read -p 'would you like to customize session & window names? "



#ask for sess & window names & store in var:
read -p 'Session Name: ', $1

#Window 1 Name:
read -p 'Window 1 Name: ', $2

#Window 2 Name:
read -p 'Window 2 Name: ', $3

#Window 3 Name:
read -p 'Window 3 Name: ', $4

#Window 4 Name:
read -p 'Window 4 Name: ', $5


#ask for user input:




# Set session name
SESSION="Pentest"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

# Only create TUMX session if on doesnt already exist
if ["$SESSIONEXISTS" = ""]
then
    #Start new session with our name
    tmux new-session -d -s $SESSION
    #Start new window
    tmux new-window -t $SESSION:0 -n 'Recon'
      #Logging Pane 0
      tmux pipe-pane -o 'cat >>~/tmux_output.#S:#I-#P'
    #Start new window
    tmux new-window -t $SESSION:1 -n 'Enumeration'
      #Logging Pane 1
      tmux pipe-pane -o 'cat >>~/tmux_output.#S:#I-#P'
    #Start new window
    tmux new-window -t $SESSION:2 -n 'Exploit'
      #Logging Pane 2
      tmux pipe-pane -o 'cat >>~/tmux_output.#S:#I-#P'
    #Start new window
    tmux new-window -t $SESSION:3 -n 'Post Exploit'
      #Logging Pane 3
      tmux pipe-pane -o 'cat >>~/tmux_output.#S:#I-#P'
    #Start new window
    tmux new-window -t $SESSION:4 -n 'Report'
      #Logging Pane 4
      tmux pipe-pane -o 'cat >>~/tmux_output.#S:#I-#P'
      
    #Name Windows and start zsh
    tmux rename-window -t 0 'Recon'
    tmux rename-window -t 1 'Enumeration'
    tmux rename-window -t 2 'Exploit'
    tmux rename-window -t 3 'Post Exploit'
    tmux rename-window -t 4 'Report'
    tmux send-keys -t 'Recon' 'zsh' C-m 'clear' C-m
fi

#Attach Session, on the Pentest window
tmux attach-session -t $SESSION:0
