name             'rubyserver'
maintainer       'Alexander Galato'
maintainer_email 'alexander.galato@gmail.com'
license          'All rights reserved'
description      'Installs/Configures rubyserver'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

recipe 'rubyserver', 'Configure services'

supports "ubuntu"

depends 'nginx'
depends 'rvm'
depends 'redisio'
depends 'database'
depends 'mysql'
depends 'mysql_tuning'
depends 'postgresql'
depends 'postfix'
depends 'postfix-dkim'
