# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
[[ -f ~/.bashrc ]] && . ~/.bashrc


if [[ ! -f ~/.ssh/ssh_agent_pid ]]
then
    eval $( ssh-agent )
    echo $SSH_AGENT_PID > ~/.ssh/ssh_agent_pid
    echo $SSH_AUTH_SOCK > ~/.ssh/ssh_auth_sock
else
    SSH_AGENT_PID=$( cat ~/.ssh/ssh_agent_pid ) ; export SSH_AGENT_PID
    SSH_AUTH_SOCK=$( cat ~/.ssh/ssh_auth_sock ) ; export SSH_AUTH_SOCK
fi

ssh-add -l > /dev/null 2>&1
if [[ $? != 0 ]] 
then
    ssh-add
fi

### session counter kludge
if [[ ! -f ~/.ssh/session_counter ]]
then
    echo 1 > ~/.ssh/session_counter
else
    nsess=$( cat ~/.ssh/session_counter )
    echo $(( $nsess + 1 )) >| ~/.ssh/session_counter
fi
