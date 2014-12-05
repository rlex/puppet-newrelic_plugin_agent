# Detect OS, set os-specific parameters
class newrelic_plugin_agent::params {
  case $::operatingsystem {
    'ubuntu', 'debian': {
      $newrelic_plugin_agent_conffile = '/etc/newrelic/newrelic-plugin-agent.cfg'
      $newrelic_plugin_agent_logdir = '/var/log/newrelic'
      $newrelic_plugin_agent_service = 'newrelic-plugin-agent'
      $newrelic_plugin_agent_package = 'newrelic-plugin-agent'
      $newrelic_plugin_agent_confdir = '/etc/newrelic'
      $newrelic_plugin_agent_init = 'newrelic_plugin_agent/etc/init.d/newrelic-plugin-agent.deb'
    }
    'redhat', 'centos', 'scientific', 'fedora', 'OracleLinux': {
      $newrelic_plugin_agent_conffile = '/etc/newrelic/newrelic-plugin-agent.cfg'
      $newrelic_plugin_agent_logdir = '/var/log/newrelic'
      $newrelic_plugin_agent_service = 'newrelic-plugin-agent'
      $newrelic_plugin_agent_package = 'newrelic-plugin-agent'
      $newrelic_plugin_agent_confdir = '/etc/newrelic/'
      $newrelic_plugin_agent_init = 'newrelic_plugin_agent/etc/init.d/newrelic-plugin-agent.deb'
    }
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }
}
