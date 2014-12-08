define newrelic_plugin_agent::couchdb (
  $host = 'localhost',
  $verify_ssl_cert = true,
  $port = '5984',
  $username = 'foo',
  $password = 'bar',
) {
  include newrelic_plugin_agent::params

  $newrelic_plugin_agent_conffile = $newrelic_plugin_agent::params::newrelic_plugin_agent_conffile

  concat::fragment { "newrelic_plugin_agent-couchdb-${name}":
    order   => '03',
    target  => $newrelic_plugin_agent_conffile,
    content => template('newrelic_plugin_agent/couchdb.erb'),
  }

}
