define newrelic_plugin_agent::apache_httpd (
  $scheme = 'http',
  $host = 'localhost',
  $verify_ssl_cert = true,
  $port = '80',
  $path = '/server-status'
) {
  include newrelic_plugin_agent::params

  $newrelic_plugin_agent_conffile = $newrelic_plugin_agent::params::newrelic_plugin_agent_conffile

  concat::fragment { "newrelic_plugin_agent-apache_httpd-${name}":
    order   => '02',
    target  => $newrelic_plugin_agent_conffile,
    content => template('newrelic_plugin_agent/apache_httpd.erb'),
  }

}
