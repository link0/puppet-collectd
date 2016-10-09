#
class collectd::config inherits collectd {
  if $collectd::config_manage {
    file { 'collectd.conf':
      ensure  => $collectd::config_ensure,
      name    => $collectd::config_name,
      content => template($collectd::config_template),
    }

    file { 'collectd.conf.d/statsd.conf':
      ensure  => $collectd::statsd_enable ? {
        true  => file,
        false => absent,
      },
      name    => '/etc/collectd/collectd.conf.d/statsd.conf',
      content => template('collectd/statsd.conf.erb'),
    }

    file { 'collectd.conf.d/network.conf':
      ensure  => $collectd::network_enable ? {
        true  => file,
        false => absent,
      },
      name    => '/etc/collectd/collectd.conf.d/network.conf',
      content => template('collectd/network.conf.erb'),
    }

    file { 'collectd.conf.d/rrdtool.conf':
      ensure  => $collectd::rrdtool_enable ? {
        true  => file,
        false => absent,
      },
      name    => '/etc/collectd/collectd.conf.d/rrdtool.conf',
      content => template('collectd/rrdtool.conf.erb'),
    }


  }
}
