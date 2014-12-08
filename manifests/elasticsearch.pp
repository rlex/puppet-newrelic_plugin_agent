define newrelic_plugin_agent::elasticsearch (
  $host = 'localhost',
  $port = '9200',
  $scheme = 'http',
) {
  include newrelic_plugin_agent::params

  $newrelic_plugin_agent_conffile = $newrelic_plugin_agent::params::newrelic_plugin_agent_conffile

  concat::fragment { "newrelic_plugin_agent-elasticsearch-${name}":
    order   => '04',
    target  => $newrelic_plugin_agent_conffile,
    content => template('newrelic_plugin_agent/elasticsearch.erb'),
  }

}
