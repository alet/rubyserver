#Ruby
set['rvm']['rubies'] = ['1.9.3-p547']
set['rvm']['default_ruby'] = node['rvm']['rubies'].first
set['rvm']['global_gems'] = [ 
	{ 'name' => 'rake' }
]

#Nginx
set['nginx']['version'] = "1.4.7"
set['nginx']['user'] = "www-data"
set['nginx']['init_style'] = "init"
set['nginx']['source']['use_existing_user']="on"
set['nginx']['source']['modules'] = %w(
	nginx::http_ssl_module
	nginx::http_gzip_static_module
	nginx::http_geoip_module
	nginx::http_spdy_module
	nginx::passenger
)

#Passenger
set['nginx']['passenger']['packages']['debian']=""
set['nginx']['passenger']['ruby'] = "#{node['rvm']['root_path']}/wrappers/ruby-#{node['rvm']['default_ruby']}/ruby"
set['nginx']['passenger']['gem_binary'] = "#{node['rvm']['root_path']}/wrappers/ruby-#{node['rvm']['default_ruby']}/gem"
set['nginx']['passenger']['root'] = "#{node['rvm']['root_path']}/gems/ruby-#{node['rvm']['default_ruby']}/gems/passenger-#{node['nginx']['passenger']['version']}"
set['nginx']['configure_flags'] = ["--add-module=#{node['rvm']['root_path']}/gems/ruby-#{node['rvm']['default_ruby']}/gems/passenger-#{node['nginx']['passenger']['version']}/ext/nginx"]
set['nginx']['passenger']['max_instances_per_app'] = "10"

#Redis
set['redisio']['default_settings'] = { 'address' => "127.0.0.1", "maxmemory" => "64M" }

#Databases
default['rubyserver']['db_root_password'] = nil
#MySQL
default['rubyserver']['databases']['mysql'] = []
set['mysql_tuning']['system_percentage'] = 50

#PostgreSQL
default['rubyserver']['databases']['postgresql'] = []
set['postgresql']['conig']['shared_buffers'] = "24M"

#Postfix
default['postfix_dkim']['testmode'] = false
