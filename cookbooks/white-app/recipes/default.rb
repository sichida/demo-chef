#
# Cookbook Name:: white-app
# Recipe:: default
#
# Copyright 2014, Shoun Ichida
#
# All rights reserved - Do Not Redistribute
#

include_recipe "nodejs::nodejs_from_package"

include_recipe "nodejs::npm"

nodejs_npm 'grunt-cli'
nodejs_npm 'bower'
nodejs_npm 'jasmine'
