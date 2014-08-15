rubyserver Cookbook
===================
This cookbook makes ruby server. Nginx, passenger, rvm, ruby, mysql | postgresql, postfix.

Requirements
------------
Ubuntu

#### Install

To install wit **Berkshelf**, add this line into 'Berksfile':

cookbook 'rubyserver', git: "git@github.com:alet/rubyserver.git"

Attributes
----------
#### rubyserver::default
node['rubyserver']['user_password'] - www-data user password. User is for developers
node['rubyserver']['db_root_password'] - databases root password

node['rubyserver']['databases']['mysql']['username'] - 
node['rubyserver']['databases']['mysql']['password'] - 
node['rubyserver']['databases']['mysql']['database_name'] - 
node['rubyserver']['databases']['postgresql']['username'] - 
node['rubyserver']['databases']['postgresql']['password'] - 
node['rubyserver']['databases']['postgresql']['database_name'] - site database atributes. If you spesify both database then will be installed both. PostgreSQL database will not create due to [COOK-1406](http://tickets.opscode.com/browse/COOK-1406), but you should point wich database install.

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
 * Author: Alexander Galato <alexander.galato@gmail.com>

Copiright 2014, Alexander Galato


Some parts included from project [databox-cookbook](https://github.com/teohm/databox-cookbook)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
