Name:    copy_files
Version: 1.1
Release: %{build_num}
License: GPL
#Source0: copy_file.tar.gz
Summary: Copy file structure.

%description
Copy file structure.

%prep
echo "%prep started"

%setup -q

%install

%clean

%post
%file

%changelog
