#!/bin/bash

spec_file=copy_file.spec

cd /home/jenkins/workspace/copy_file/rpm-build
while getopts b: name
do
	case $name in
		b)
			build_num="$OPTARG"
		;;
   		?)
			echo "Specify the parameter.Check the following example."
            echo "Example: sh build.sh -b <build_num>"
			exit 1
          	;;
    esac
done;



rpmbuild -ba --define "build_num $build_num" $spec_file

if [ $? == 0  ]; then
   echo "success"
else
   echo "fail"
fi
