#!/bin/bash

while true; do

# Ask if user wants to customize Sess & window names
read -p 'Customize session & window names? (y/n), press '*' to exit: ' yn
case $yn in
    y ) echo "No spaces in name or use underscore!"
        sleep 2s
        # Ask for sess & window names & store in var:
        read -p 'Session Name: ' SESSION

        #Window 1 Name:
        read -p 'Window 1 Name: ' w0
            
        #Window 2 Name:
        read -p 'Window 2 Name: ' w1
         
        #Window 3 Name:
        read -p 'Window 3 Name: ' w2
         
        #Window 4 Name:
        read -p 'Window 4 Name: ' w3

        #Window 5 Name:
        read -p 'Window 5 Name: ' w4
        break;;
    
    n ) # Set default naming schema
        SESSION= 'Pentest'

        #Window 1 Name:
        w0='Recon'
         
        #Window 2 Name:
        w1='Enumeration'

        #Window 3 Name:
        w2='Exploit'

        #Window 4 Name:
        w3='Post Exploit'

        #Window 5 Name:
        w4='Report'
        break;;
    * ) exit 1;;
esac
done

# Grab session name
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

# Only create TUMX session if on doesnt already exist
if ["$SESSIONEXISTS" = ""]
then
    # Start new session with our name
    tmux new-session -d -s $SESSION
    
    # Logging var shortcut
    sip=$(tmux pipe-pane -o 'cat >>~/tmux_output.#S:#I-#P')
    
    # Start new window & log pane
    tmux new-window -a -t $SESSION:0 -n $w0 && $sip
       
    # Start new window & log pane
    tmux new-window -a -t $SESSION:1 -n $w1 && $sip
      
    #Start new window & log pane
    tmux new-window -a -t $SESSION:2 -n $w2 && $sip
    
    #Start new window & log pane
    tmux new-window -a -t $SESSION:3 -n $w3 && $sip
    
    #Start new window & log pane
    tmux new-window -a -t $SESSION:4 -n $w4 && $sip
      
    #Name Windows and start zsh
    tmux rename-window -t 0 $w0
    tmux rename-window -t 1 $w1
    tmux rename-window -t 2 $w2
    tmux rename-window -t 3 $w3
    tmux rename-window -t 4 $w4
    tmux send-keys -t $w0 'zsh' C-m 'clear' C-m
fi

#Attach Session, on the Pentest window
tmux attach-session -t $SESSION:0
