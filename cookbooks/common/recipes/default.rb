#
# Cookbook Name:: common
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

node[:packages].each do |p|
	if p[:version]
		package p.name do
			version p[:version]
			action :install
		end
	else
		package p.name do
			action :install
		end
	end
end