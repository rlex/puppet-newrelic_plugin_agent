define newrelic_plugin_agent::memcached (
  $host = 'localhost',
  $port = undef,
  $path = undef,
) {
  include newrelic_plugin_agent::params

  $newrelic_plugin_agent_conffile = $newrelic_plugin_agent::params::newrelic_plugin_agent_conffile

  concat::fragment { "newrelic_plugin_agent-memcached-${name}":
    order   => '5',
    target  => $newrelic_plugin_agent_conffile,
    content => template('newrelic_plugin_agent/memcached.erb'),
  }

}
