class { 'newrelic_plugin_agent':
  license_key          => 'THIS_IS_WRONG_LICENSE_KEY',
  newrelic_api_timeout => '10',
  wake_interval        => '60',
  enable               => true,
  user                 => 'newrelic',
  restart              => true,
  pidfile              => '/var/run/newrelic/newrelic-plugin-agent.pid',
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
  host => 'localhost',
  port => '27017',
  ssl  => 'False',
}

newrelic_plugin_agent::nginx { 'nginx 1':
  scheme          => 'http',
  host            => 'localhost',
  verify_ssl_cert => 'True',
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
  host => 'localhost',
  port => '6379',
}
