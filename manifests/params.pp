#
class collectd::params {

  $package_manage = true
  $package_ensure = installed
  $package_name = 'collectd'

  $service_manage = true
  $service_ensure = running
  $service_name = 'collectd'

  $config_manage = true
  $config_ensure = file
  $config_name = '/etc/collectd/collectd.conf'
  $config_template = 'collectd/collectd.conf.erb'

  $hostname = 'localhost'

  $plugins = []

  $statsd_enable = false
  $rrdtool_enable = true
  $rrdtool_datadir = '/var/lib/collectd/rrd'

  $network_enable = false
  $network_hostname = 'localhost'
  $network_port = 25826
}
