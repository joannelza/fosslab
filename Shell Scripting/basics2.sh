#!/bin/bash
echo $(lsb_release -a)
echo
echo "All available shells: $(cat /etc/shells)"
echo
echo "Mouse settings : $(xinput --list --short)"
echo
echo "CPU information: $(lscpu)"
echo
echo "Memory information: $(free -m)"
