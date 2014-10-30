#
# Copyright 2014, Shoun Ichida
#
# All rights reserved - Do Not Redistribute
#

default_conf 			= [node[:nginx][:conf_dir],node[:nginx][:sites_available],node[:nginx][:balancing_conf]].join('/')
default_conf_enabled	= [node[:nginx][:conf_dir],node[:nginx][:sites_enabled],node[:nginx][:balancing_conf]].join('/')

nodes = []

partial_search(:node, 'role:front',
  :keys => { 'name' => [ 'name' ],
             'ip'   => [ 'ipaddress' ],
             'kernel_version' => [ 'kernel', 'version' ]
           }
).each do |result|
  if result['name'] == 'front-1'
  	nodes.push({name: 'front-1', ip: '192.168.56.102'})
  elsif result['name'] == 'front-2'
	nodes.push({name: 'front-2', ip: '192.168.56.103'})
  end
  # nodes.push({name: result['name'], ip: result['ip']})
end

template default_conf do
  source "lb.conf.erb"
  variables(
    :nodes => nodes
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
