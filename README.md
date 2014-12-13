This is module for managing modular newrelic agent from [MeetMe](http://github.com/MeetMe/newrelic-plugin-agent)  

It's still work-in-progress, but already can be used in production.  
Status:  
* Installs, configures and starts without problems 
* All services supported (but not with all options) 
* No multi-daemon support (for now)  
* Tested only on Debian 7, although it have RPM-based distros support 
* Almost no docs except example (not with all options) config

Example config:
```puppet
class { newrelic_plugin_agent:
  license_key          => 'THIS_IS_YOUR_LICENSE_KEY',
  newrelic_api_timeout => '10',
  wake_interval        => '60',
  enable               => true,
  user                 => 'newrelic',
  restart              => true,
  pidfile              => "/var/run/newrelic/newrelic-plugin-agent.pid",
}

newrelic_plugin_agent::memcached { 'memcached 1':
  host => 'localhost',
  port => '11211',
}

newrelic_plugin_agent::apache_httpd { 'apache 1': 
  scheme          => 'http',
  host            => 'localhost',
  verify_ssl_cert => 'True',
  port            => '80',
  path            => '/server-status'
}

newrelic_plugin_agent::mongodb { 'mongo 1':
  host      => 'localhost',
  port      => '27017',
  ssl       => 'False',
  databases => [ 'first-db', 'second-db' ]
}

newrelic_plugin_agent::nginx { 'nginx 1':
  scheme          => 'http',
  host            => 'localhost',
  verify_ssl_cert => 'False',
  port            => '80',
  path            => '/server-status'
}

newrelic_plugin_agent::php_fpm { 'php-fpm 1':
  scheme => 'https',
  host   => 'localhost',
  port   => '443',
  path   => '/fpm_status',
  query  => 'json',
}

newrelic_plugin_agent::redis { 'redis 1': 
  host      => 'localhost',
  port      => '6379',
  #path     => '/path/to/unix/socket',
  #db_count => '1',
  #password => 'pass',
}

newrelic_plugin_agent::riak { 'riak 1': 
  host            => 'node0.riak0.scs.mtmeprod.net',
  verify_ssl_cert => 'true',
  port            => '8098'
}

newrelic_plugin_agent::couchdb { 'couchdb 1': 
  host            => 'localhost',
  verify_ssl_cert => 'true',
  port            => '5984',
  username        => 'foo',
  password        => 'bar',
}

newrelic_plugin_agent::uwsgi { 'uwsgi 1': 
  host => 'localhost',
  port => '1717',
  path => '/path/to/unix/socket',
}

newrelic_plugin_agent::haproxy { 'haproxy 1': 
  name            => 'haproxy',
  scheme          => 'http',
  host            => 'localhost',
  port            => '8080',
  verify_ssl_cert => 'true',
  path            => '/haproxy?stats;csv',
}

newrelic_plugin_agent::postgresql { 'postgresql 1': 
  host      => 'localhost',
  port      => '5432',
  user      => 'postgres',
  dbname    => 'postgres',
  superuser => 'False',
}

newrelic_plugin_agent::pgbouncer { 'pgbouncer 1': 
  host => 'localhost',
  port => '6000',
  user => 'stats',
}

newrelic_plugin_agent::php_npc { 'PHP APC 1': 
  scheme          => 'http',
  host            => 'localhost',
  verify_ssl_cert => 'true',
  port            => '80',
  path            => '/apc-nrp.php',
}

newrelic_plugin_agent::rabbitmq { 'RabbitMQ 1':
  host            => 'localhost',
  port            => '15672',
  verify_ssl_cert => 'true',
  username        => 'guest',
  password        => 'guest',
}

newrelic_plugin_agent::elasticsearch { 'ElasticSearch 1':
  host   => 'localhost',
  port   => '9200',
  scheme => 'http',
}
```
