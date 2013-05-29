#
# Cookbook Name:: nginx-dev
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

directory "/var/log/nginx-dev" do
  owner "root"
  group "root"
  mode "755"
  recursive true
end

directory "/etc/nginx-dev" do
  owner "root"
  group "root"
  mode "755"
  recursive true
end

directory "/etc/nginx-dev/conf.d" do
  owner "root"
  group "root"
  mode "755"
  recursive true
end

template "/etc/nginx-dev/fastcgi_params" do
  source "fastcgi_params"
  owner "root"
  group "root"
  mode 0644
end

template "/etc/nginx-dev/mime.types" do
  source "mime.types"
  owner "root"
  group "root"
  mode 0644
end

template "/etc/nginx-dev/scgi_params" do
  source "scgi_params"
  owner "root"
  group "root"
  mode 0644
end

template "/etc/nginx-dev/uwsgi_params" do
  source "uwsgi_params"
  owner "root"
  group "root"
  mode 0644
end

template "/etc/sysconfig/nginx-dev" do
  source nginx-dev
  owner "root"
  group "root"
  mode 0644
end

template "/etc/nginx-dev/conf.d/railsapp_dev.conf" do
  source railsapp_dev.conf
  owner "root"
  grop "root"
  mode 0644
end

template "/etc/nginx-dev/conf.d/railsapp_dev-ssl.conf" do
  source railsapp_dev-ssl.conf
  owner "root"
  grop "root"
  mode 0644
end

template "/etc/nginx-dev/nginx-dev.conf" do
  source "nginx-dev.conf"
  owner "root"
  group "root"
  mode 0644
  #notifies :reload, 'service[nginx]'
end

service "nginx-dev" do
  supports :status => true, :restart => true, :reload => true, :status => true
  action    [ :enable, :start ]
end
