#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'apache2' do
  action :install
end

puts(node[:apache][:conf_dir])

template [node[:apache][:conf_dir],node[:apache][:site_availables],node[:apache][:default_conf]].join('/') do
  source "default.conf.erb"
  variables(
    :home_dir => node[:apache][:home_dir]
  )
  action :create
end

link [node[:apache][:conf_dir],node[:apache][:sites_available],node[:apache][:default_conf]].join('/') do
  to [node[:apache][:conf_dir],node[:apache][:sites_enabled],node[:apache][:default_conf]].join('/')
  only_if "test -L #{[node[:apache][:conf_dir],node[:apache][:site_enabled],node[:apache][:default_conf]].join('/')}"
end

file [node[:apache][:conf_dir],node[:apache][:sites_enabled],'000-default.conf'].join('/') do
     action :delete
end

cookbook_file [node[:apache][:home_dir],node[:apache][:welcome_page]].join('/') do
  source 'index.html'
  mode '0644'
end

service 'apache2' do
  action [ :enable, :start ]
end