# /etc/skel/.bash_logout

# This file is sourced when a login shell terminates.

echo LOGGING OUT

### session counter kludge
if [[ -f ~/.ssh/session_counter ]] 
then
    nsess=$(( $( cat ~/.ssh/session_counter ) - 1 ))
    if [[ $nsess -eq 0 ]]
    then
        rm -f ~/.ssh/session_counter ~/.ssh/ssh_agent_pid ~/.ssh/ssh_auth_sock
        ssh-agent -k
    else
        echo $nsess >| ~/.ssh/session_counter
    fi
fi

sleep 1


# Clear the screen for security's sake.
clear
