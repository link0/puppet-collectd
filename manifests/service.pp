#
class collectd::service inherits collectd {

  if $collectd::service_manage {
    service { 'collectd':
      ensure => $collectd::service_ensure,
      name   => $collectd::service_name,
    }
  }

}
