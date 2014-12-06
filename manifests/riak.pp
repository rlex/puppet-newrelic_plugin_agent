define newrelic_plugin_agent::riak (
    $host = 'node0.riak0.scs.mtmeprod.net',
    $verify_ssl_cert = true,
    $port = '8098',
) {
  include newrelic_plugin_agent::params

  $newrelic_plugin_agent_conffile = $newrelic_plugin_agent::params::newrelic_plugin_agent_conffile

  concat::fragment { "newrelic_plugin_agent-riak-${name}":
    order   => '12',
    target  => $newrelic_plugin_agent_conffile,
    content => template('newrelic_plugin_agent/riak.erb'),
  }

}
