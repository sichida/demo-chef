#
# Copyright 2014, Shoun Ichida
#
# All rights reserved - Do Not Redistribute
#

default_conf 			= [node[:nginx][:conf_dir],node[:nginx][:sites_available],node[:nginx][:balancing_conf]].join('/')
default_conf_enabled	= [node[:nginx][:conf_dir],node[:nginx][:sites_enabled],node[:nginx][:balancing_conf]].join('/')

template default_conf do
  source "lb.conf.erb"
  variables(
    
  )
  mode "0644"
  action :create
  notifies :restart, "service[nginx]"
end

link default_conf_enabled do
  to default_conf
  only_if "test -f #{default_conf}"
  notifies :restart, "service[nginx]"
end
