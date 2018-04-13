#!/bin/bash


while getopts m:b:d: name
do
	case $name in
		m)
			git_msg="$OPTARG"
		;;
    	b)
			git_branch=$OPTARG
		;;
		d)
		    git_dir=$OPTARG
		;;
   		?)
			err_msg
			exit 1
          	;;
    esac
done;

if [[ ! -z $git_msg ]] && [[ ! -z $git_branch ]]; then
    git add $git_dir
    cd $git_dir
    git commit -m "$git_msg"
    git push origin "$git_branch"
else
    echo "Specify the parameter.Check the following example."
    echo "Example: sh git_push.sh -m <"Enter commit msg" -d <branch_name>>"
    exit 1
fi