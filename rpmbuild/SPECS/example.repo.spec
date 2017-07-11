Name:           opt
Version:        1
Release:        0
Summary:        example repo

License:        GPL
URL:            http://example.com 
Source:         opt.tar.gz

#BuildArch: 	norch
#BuildRoot:	%{_tmppath}/%{name}-buildroot


# This example identifies the package as only working on the Intel i386, IA-64, and Alpha architectures.

#ExclusiveArch: ExclusiveArch: i386 ia64 alpha
%description
Create a yum repo file.

%prep
%setup -q -n %{name}


%install
#tar -zxvf /root/rpmbuild/SOURCES/swapnil-1.tar.gz -C "$RPM_BUILD_ROOT"
cp -r  /root/opt "$RPM_BUILD_ROOT" 
echo "$RPM_BUILD_ROOT: This the path"

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root)
# This following path should be present on $RPM_BUILD_ROOT.
/opt
