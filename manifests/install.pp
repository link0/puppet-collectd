#
class collectd::install inherits collectd {

  if $collectd::package_manage {

    package { 'collectd':
      ensure  => $collectd::package_ensure,
      name    => $collectd::package_name,
    }
  }

}
