node["oracle"]["client_packages_x86_64"].each do |client_package_x86_64|
  yum_package client_package_x86_64 do
    action :install
  end
end

node["oracle"]["client_packages_x86"].each do |client_package_x86|
  yum_package client_package_x86 do
    action :install
  end
end
 
group "dba" do
  gid 501
  ignore_failure true
end

group "oinstall" do
  gid 502
  ignore_failure true
end

user "oracle" do
  uid 501
  gid "oinstall"
  home "/home/oracle"
  shell "/bin/bash"
  ignore_failure true
  supports :manage_home => true
  comment "Oracle"
end

template "/home/oracle/.bashrc" do
  source ".bashrc"
  group "oracle"
  owner "oinstall"
  mode "644"
end

directory "/u01/app" do
  owner "oracle"
  group "oinstall"
  mode "755"
  recursive true
end
