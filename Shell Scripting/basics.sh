#!/bin/bash
 
n=$(logname)
echo "Currently logged and  logname: $n "
echo "Current shell: $SHELL "
echo "Home directory: $HOME "
echo "Operating System type : $(arch) "
echo "Current path setting: $PATH "
echo "Current working directory: $(pwd) "
echo "Currently logged no: of users: $(users) "
