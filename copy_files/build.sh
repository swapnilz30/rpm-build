#!/bin/bash

spec_file=copy_file.spec

cd /home/jenkins/workspace/copy_files/rpm-build/copy_files
tar -czvf ${pkg_name}.tar.gz ${pkg_name}
cp ${pkg_name}.tar.gz $RPM_SOURCE_DIR


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
