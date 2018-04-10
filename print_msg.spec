Name:           print_msg
Version:        1
#Release:       1%{?dist}
Release:        %{build_num}
Summary:        Small epic script but not really usable

#Group:          Utilities
License:        GPL
Source0:        print_msg-1.tar.gz
#BuildArch:      noarch
#Autoreq:        yes
#Requires:vim, screen
Requires: erlang, rabbitmq-server
%description
Small epic script that prints some stuff


%prep

%setup -q


%install
%{echo "% install started"}
#rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT/opt/print_msg/print_msg
install printmsg.sh $RPM_BUILD_ROOT/opt/print_msg/printmsg.sh


%clean
rm -rf $RPM_BUILD_ROOT

%post
     systemctl enable rabbitmq-server
     systemctl start rabbitmq-server
     rabbitmqctl delete_user guest
     rabbitmqctl add_user cyops changeme
     rabbitmqctl set_user_tags cyops administrator
#./opt/print_msg/printmsg.sh

%files
%defattr(-,root,root,-)
/opt/print_msg/printmsg.sh
%doc

%changelog