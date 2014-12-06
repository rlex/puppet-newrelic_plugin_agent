define newrelic_plugin_agent::postgresql (
  $host = 'localhost',
  $port = '5432',
  $user = 'postgres',
  $dbname = 'postgres',
  $superuser = 'False',
) {
  include newrelic_plugin_agent::params

  $newrelic_plugin_agent_conffile = $newrelic_plugin_agent::params::newrelic_plugin_agent_conffile

  concat::fragment { "newrelic_plugin_agent-postgresql-${name}":
    order   => '10',
    target  => $newrelic_plugin_agent_conffile,
    content => template('newrelic_plugin_agent/postgresql.erb'),
  }

}
