define newrelic_plugin_agent::mongodb (
  $host = 'localhost',
  $port = '27017',
  $ssl = false,
  $admin_username = undef,
  $admin_password = undef,
  $ssl_keyfile = undef,
  $ssl_certfile = undef,
  $ssl_cert_reqs = '0',
  $ssl_ca_certs = undef,
  ) {
  include newrelic_plugin_agent::params

  $newrelic_plugin_agent_conffile = $newrelic_plugin_agent::params::newrelic_plugin_agent_conffile

  concat::fragment { "newrelic_plugin_agent-mongodb-${name}":
    order   => '07',
    target  => $newrelic_plugin_agent_conffile,
    content => template('newrelic_plugin_agent/mongodb.erb'),
  }

}
