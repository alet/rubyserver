#
# Cookbook Name:: rubyserver
# Recipe:: default
#

package "libcurl4-openssl-dev"
include_recipe "rvm::system"
user 'www-data' do
	shell'/bin/bash'
	home '/var/www'
	supports :manage_home => true
	password	node['rubyserver']['user_password']
end
include_recipe "nginx::source"
package "imagemagick"

include_recipe "redisio::install"
include_recipe "redisio::enable"

if node['rubyserver']['databases']['mysql']
	include_recipe 'rubyserver::mysql'
end
if node['rubyserver']['databases']['postgresql']
	include_recipe 'rubyserver::postgresql'
end

include_recipe "postfix::server"

package 'opendkim-tools'
include_recipe "postfix-dkim"
service 'opendkim' do
	action :restart
end

execute "Clean up from previos runs" do
	user "root"
	command 'sed -i "/#dkim-start/,/#dkim-end/d" /etc/postfix/main.cf'
end

template '/tmp/dkim.conf' do
	source 'dkim.erb'
end

execute "Add dkim support" do
	user "root"
	command 'cat /tmp/dkim.conf >> /etc/postfix/main.cf'
	notifies :restart, 'service[postfix]'
end
