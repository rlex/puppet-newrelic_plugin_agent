define newrelic_plugin_agent::pgbouncer (
  $host = 'localhost',
  $port = '6000',
  $user = 'stats',
) {
  include newrelic_plugin_agent::params

  $newrelic_plugin_agent_conffile = $newrelic_plugin_agent::params::newrelic_plugin_agent_conffile

  concat::fragment { "newrelic_plugin_agent-pgbouncer-${name}":
    order   => '09',
    target  => $newrelic_plugin_agent_conffile,
    content => template('newrelic_plugin_agent/pgbouncer.erb'),
  }

}
