define newrelic_plugin_agent::php_fpm (
  $sourcename = 'fpm-pool',
  $scheme = 'https',
  $host = 'localhost',
  $port = '443',
  $path = '/fpm_status',
  $query = 'json',
) {
  include newrelic_plugin_agent::params

  $newrelic_plugin_agent_conffile = $newrelic_plugin_agent::params::newrelic_plugin_agent_conffile

  concat::fragment { "newrelic_plugin_agent-php_fpm-${name}":
    order   => '1',
    target  => $newrelic_plugin_agent_conffile,
    content => template('newrelic_plugin_agent/php_fpm.erb'),
  }

}
