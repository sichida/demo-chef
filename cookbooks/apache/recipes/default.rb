#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2014, Shoun Ichida
#
# All rights reserved - Do Not Redistribute
#

package 'apache2' do
  action :install
end

default_conf          = [node[:apache][:conf_dir],node[:apache][:sites_available],node[:apache][:default_conf]].join('/')
default_conf_enabled  = [node[:apache][:conf_dir],node[:apache][:sites_enabled],node[:apache][:default_conf]].join('/')

template default_conf do
  source "default.conf.erb"
  variables(
    :home_dir => node[:apache][:home_dir]
  )
  mode "0644"
  action :create
end

link default_conf_enabled do
  to default_conf
  only_if "test -f #{default_conf}"
  notifies :restart, "service[apache2]"
end

file [node[:apache][:conf_dir],node[:apache][:sites_enabled],'000-default.conf'].join('/') do
  action :delete
  notifies :restart, "service[apache2]"
end

cookbook_file [node[:apache][:home_dir],node[:apache][:welcome_page]].join('/') do
  source 'index.html'
  mode '0644'
end

service 'apache2' do
  action [ :enable, :start ]
end


template [node[:apache][:home_dir],'host.html'].join('/') do
  source "host.html.erb"
  variables(
    :hostname => node[:hostname]
  )
  mode "0644"
  action :create
end