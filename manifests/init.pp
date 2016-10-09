#
class collectd (

  $package_manage  = $collectd::params::package_manage,
  $package_ensure  = $collectd::params::package_ensure,
  $package_name    = $collectd::params::package_name,

  $service_manage  = $collectd::params::service_manage,
  $service_ensure  = $collectd::params::service_ensure,
  $service_name    = $collectd::params::service_name,

  $config_manage   = $collectd::params::config_manage,
  $config_ensure   = $collectd::params::config_ensure,
  $config_name     = $collectd::params::config_name,
  $config_template = $collectd::params::config_template,

  $hostname        = $collectd::params::hostname,
  $plugins         = $collectd::params::plugins,

  $statsd_enable   = $collectd::params::statsd_enable,
  $rrdtool_enable  = $collectd::params::rrdtool_enable,
  $rrdtool_datadir = $collectd::params::rrdtool_datadir,

  $network_enable   = $collectd::params::network_enable,
  $network_hostname = $collectd::params::network_hostname,
  $network_port     = $collectd::params::network_port,


) inherits collectd::params {

  validate_bool($package_manage)
  validate_re($package_ensure, '^installed|absent|latest$')
  validate_string($package_name)

  validate_bool($service_manage)
  validate_re($service_ensure, '^running|stopped$')
  validate_string($service_name)

  validate_bool($config_manage)
  validate_re($config_ensure, '^file|absent$')
  validate_absolute_path($config_name)
  validate_string($config_template)

  validate_string($hostname)
  validate_array($plugins)

  if $rrdtool_enable {
    validate_absolute_path($rrdtool_datadir)
  }

  if $network_enable {
    validate_string($network_hostname)
    validate_integer($network_port)
  }

  # http://docs.puppetlabs.com/puppet/2.7/reference/lang_containment.html#known-issues
  anchor { 'collectd::begin': } ->
  class { '::collectd::install': } ->
  class { '::collectd::config': } ~>
  class { '::collectd::service': } ->
  anchor { 'collectd::end': }

}
