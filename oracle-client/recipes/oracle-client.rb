
#node.set["sysctl"]["is_oracle_client"] = true

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
  #members node["oracle"]["dbas"]
end

group "oinstall" do
  gid 502
  ignore_failure true
  #members node["oracle"]["dbas"]
end

user "oracle" do
  uid 501
  gid "oinstall"
  home "/home/oracle"
  shell "/bin/bash"
  ignore_failure true
  supports :manage_home => true
  comment "Oracle Service Account - DBA"
end

directory "/u01/app" do
  owner "oracle"
  group "oinstall"
  mode "755"
  recursive true
end
