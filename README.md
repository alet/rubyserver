rubyserver Cookbook
===================
This cookbook makes ruby server. Nginx, passenger, rvm, ruby, mysql | postgresql, postfix.

Requirements
------------
Ubuntu

#### packages

Attributes
----------
#### rubyserver::default
node['rubyserver']['user_password'] - www-data user password. User is for developers
node['rubyserver']['db_root_password'] - databases root password

node['rubyserver']['databases']['mysql']['username']
node['rubyserver']['databases']['mysql']['password']
node['rubyserver']['databases']['mysql']['database_name']
node['rubyserver']['databases']['postgresql']['username']
node['rubyserver']['databases']['postgresql']['password']
node['rubyserver']['databases']['postgresql']['database_name'] - site database atributes

node['rubyserver']['ruby']['versions'] - list of ruby versions setuped by rvm
node['rubyserver']['ruby']['global_version'] - default version of ruby

Usage
-----
#### rubyserver::default

Include `rubyserver` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[rubyserver]"
  ]
}
```

License and Authors
-------------------
Authors: Alexander Galato
