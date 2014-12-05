# Primary class with options
class newrelic_plugin_agent (
  $license_key = undef,
  $newrelic_api_timeout = '10',
  $wake_interval = '60',
  $enable = true,
  $user = newrelic,
  $restart = true,
  $proxy = undef,
  $pidfile = '/var/run/newrelic/newrelic-plugin-agent.pid',
) {

  include newrelic_plugin_agent::params

  # Localize some variables
  $newrelic_plugin_agent_package  = $newrelic_plugin_agent::params::newrelic_plugin_agent_package
  $newrelic_plugin_agent_conffile = $newrelic_plugin_agent::params::newrelic_plugin_agent_conffile
  $newrelic_plugin_agent_confdir  = $newrelic_plugin_agent::params::newrelic_plugin_agent_conffile
  $newrelic_plugin_agent_logdir   = $newrelic_plugin_agent::params::newrelic_plugin_agent_logdir
  $newrelic_plugin_agent_service  = $newrelic_plugin_agent::params::newrelic_plugin_agent_service
  $newrelic_plugin_agent_init     = $newrelic_plugin_agent::params::newrelic_plugin_agent_init

  package { $newrelic_plugin_agent_package:
    ensure   => installed,
    provider => 'pip'
  }

  group { 'newrelic':
    name => $user,
    ensure => present,
    system => true,
    before => Package[$newrelic_plugin_agent_package]
  }

  user { 'newrelic-user':
    name   => $user,
    system => true,
    ensure => present,
    require => Group[$user],
    before => Package[$newrelic_plugin_agent_package]
  }

  service { 'newrelic-plugin-agent':
    ensure  => $service_ensure,
    name    => $newrelic_plugin_agent_service,
    enable  => $service_enable,
    require => [ Package[$newrelic_plugin_agent_package], 
                 File[$newrelic_plugin_agent_confdir],
                 File[$newrelic_plugin_agent_logdir],
               ],
  }

  file { '/etc/init.d/newrelic-plugin-agent':
    content => template($newrelic_plugin_agent_init),
    mode    => '0755',
  }

  file { $newrelic_plugin_agent_logdir:
    ensure => 'directory',
    owner  => $user,
    group  => $user,
    before => Service[$newrelic_plugin_agent_service],
    require => [ Group[$user], User[$user] ]
  }

  file { $newrelic_plugin_agent_confdir:
    ensure => 'directory',
    owner  => $user,
    group  => $user,
    before => Service[$newrelic_plugin_agent_service],
    require => [ Group[$user], User[$user] ]
  }

  concat::fragment { 'newrelic_plugin_agent-header':
    order   => '00',
    target  => $newrelic_plugin_agent_conffile,
    content => template('newrelic_plugin_agent/newrelic-plugin-agent-header.cfg.erb'),
    require => Package[$newrelic_plugin_agent_package],
  }

  concat::fragment { 'newrelic_plugin_agent-footer':
    order   => '99',
    target  => $newrelic_plugin_agent_conffile,
    content => template('newrelic_plugin_agent/newrelic-plugin-agent-footer.cfg.erb'),
    require => Package[$newrelic_plugin_agent_package],
  }

  if $restart {
    concat { $newrelic_plugin_agent_conffile:
      notify  => Service[$newrelic_plugin_agent_service],
      require => [ Package[$newrelic_plugin_agent_package], 
                   File[$newrelic_plugin_agent_confdir],
                   File[$newrelic_plugin_agent_logdir],
                 ],
    }
  } else {
    concat { $newrelic_plugin_agent_conffile:
      require => [ Package[$newrelic_plugin_agent_package], 
                   File[$newrelic_plugin_agent_confdir],
                   File[$newrelic_plugin_agent_logdir],
                 ],
    }
  }



}

