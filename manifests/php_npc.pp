define newrelic_plugin_agent::php_npc (
    $scheme = 'http',
    $host = 'localhost',
    $verify_ssl_cert = 'true',
    $port = '80',
    $path = '/apc-nrp.php',
  ) {
  include newrelic_plugin_agent::params

  $newrelic_plugin_agent_conffile = $newrelic_plugin_agent::params::newrelic_plugin_agent_conffile

  concat::fragment { "newrelic_plugin_agent-php_npc-${name}":
    order   => '10',
    target  => $newrelic_plugin_agent_conffile,
    content => template('newrelic_plugin_agent/php_npc.erb'),
  }

}
