define newrelic_plugin_agent::redis (
  $host = 'localhost',
  $port = undef,
  $path = undef,
  $db_count = undef,
  $password = undef,
) {
  include newrelic_plugin_agent::params

  $newrelic_plugin_agent_conffile = $newrelic_plugin_agent::params::newrelic_plugin_agent_conffile

  concat::fragment { "newrelic_plugin_agent-redis-${name}":
    order   => '12',
    target  => $newrelic_plugin_agent_conffile,
    content => template('newrelic_plugin_agent/redis.erb'),
  }

}
