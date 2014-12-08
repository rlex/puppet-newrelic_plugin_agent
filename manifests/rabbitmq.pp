define newrelic_plugin_agent::rabbitmq (
    $host = 'localhost',
    $port = '15672',
    $verify_ssl_cert = 'true',
    $username = 'guest',
    $password = 'guest',
) {
  include newrelic_plugin_agent::params

  $newrelic_plugin_agent_conffile = $newrelic_plugin_agent::params::newrelic_plugin_agent_conffile

  concat::fragment { "newrelic_plugin_agent-rabbitmq-${name}":
    order   => '13',
    target  => $newrelic_plugin_agent_conffile,
    content => template('newrelic_plugin_agent/rabbitmq.erb'),
  }

}
