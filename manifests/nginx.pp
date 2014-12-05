define newrelic_plugin_agent::nginx (
  $scheme = 'http',
  $host = 'localhost',
  $verify_ssl_cert = true,
  $port = '80',
  $path = '/server-status'
) {
  include newrelic_plugin_agent::params

  $newrelic_plugin_agent_conffile = $newrelic_plugin_agent::params::newrelic_plugin_agent_conffile

  concat::fragment { "newrelic_plugin_agent-nginx-${name}":
    order   => '4',
    target  => $newrelic_plugin_agent_conffile,
    content => template('newrelic_plugin_agent/nginx.erb'),
  }

}
