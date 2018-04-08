#!/bin/bash
#1. Delcare the variables
#2. Copy the tar.gz file to the SOURCES

# pkg_name-version-release.x86_64
release=2.0
spec_file=print_msg.spec
pkg_name=print_msg-1

RPM_SOURCE_DIR="/home/jenkins/rpmbuild/SOURCES"
RPM_BUILD_DIR="/home/jenkins/rpmbuild/BUILD"
RPM_BUILD_ROOT="/home/jenkins/rpmbuild/BUILDROOT/${pkg_name}-${release}.x86_64"

export RPM_SOURCE_DIR RPM_BUILD_DIR RPM_BUILD_ROOT

tar -czvf ${pkg_name}.tar.gz /home/jenkins/workspace/rpm-build-test/rpm-build/${pkg_name}
cp ${pkg_name}.tar.gz $RPM_SOURCE_DIR

rpmbuild -ba --define "release $release" rpm-build/$spec_file

if [ $? == 0  ]; then
   echo "success"
else
   echo "fail"
fi