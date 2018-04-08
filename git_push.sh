#!/bin/bash


while getopts m:d: name
do
	case $name in
		m)
			git_msg="$OPTARG"
		;;
    	d)
			git_branch=$OPTARG
		;;
   		?)
			err_msg
			exit 1
          	;;
    esac
done;

if [[ ! -z $git_msg ]] && [[ ! -z $git_branch ]]; then
    git add /Users/swapnil/rpm-build
    cd /Users/swapnil/rpm-build
    git commit -m "$git_msg"
    git push origin "$git_branch"
else
    echo "Specify the parameter.Check the following example."
    echo "Example: sh git_push.sh -m <"Enter commit msg" -d <branch_name>>"
    exit 1
fi