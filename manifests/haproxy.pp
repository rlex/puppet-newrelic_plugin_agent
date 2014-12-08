define newrelic_plugin_agent::haproxy (
    $scheme = 'http',
    $host = 'localhost',
    $port = '8080',
    $verify_ssl_cert = 'true',
    $path = '/haproxy?stats;csv',
) {
  include newrelic_plugin_agent::params

  $newrelic_plugin_agent_conffile = $newrelic_plugin_agent::params::newrelic_plugin_agent_conffile

  concat::fragment { "newrelic_plugin_agent-haproxy-${name}":
    order   => '05',
    target  => $newrelic_plugin_agent_conffile,
    content => template('newrelic_plugin_agent/haproxy.erb'),
  }

}
