#
# Cookbook Name:: white-app
# Recipe:: mep
#
# Copyright 2014, Shoun Ichida
#
# All rights reserved - Do Not Redistribute
#

# puts node['white-app'][:version]













































# if node['white-app'][:current_version] != node['white-app'][:version]
# 	git [node[:project][:home], node[:project][:name]].join('/') do
# 		repository node[:git][:repository]
# 		revision node['white-app'][:version]
# 		# user, ssh_wrapper, timeout
# 		action :sync
# 	end

# 	execute "npm install" do
# 		command "npm install"
# 		cwd		[node[:project][:home], node[:project][:name]].join('/')
# 	end

# 	execute "bower install" do
# 		command "bower install --allow-root"
# 		cwd		[node[:project][:home], node[:project][:name]].join('/')
# 	end

# 	execute "grunt build" do
# 		command "grunt build"
# 		cwd		[node[:project][:home], node[:project][:name]].join('/')
# 	end

# 	directory [node[:apache][:home_dir], node[:project][:name], node['white-app'][:version]].join('/') do
# 		mode 0755
# 		recursive true
# 		action :create
# 	end

# 	execute "copy app" do
# 		command "cp -r #{[node[:project][:home], node[:project][:name], 'dist', '*'].join('/')} #{[node[:apache][:home_dir], node[:project][:name], node['white-app'][:version]].join('/')}"
# 	end

# 	# Set the current version to deployed application
# 	node.default['white-app'][:current_version] = node['white-app'][:version]
# end
