#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2014, Shoun Ichida
#
# All rights reserved - Do Not Redistribute
#

package 'nginx' do
  action :install
end

service 'nginx' do
  action [ :enable, :start ]
end
