# link0/puppet-collectd
[![Build status][build-img]][build-url]
[![License badge][license-img]][license-url]
[![Puppet badge][puppet-img]][puppet-url]

## Overview

The [link0/collectd](https://forge.puppet.com/link0/collectd) module installs, configures and manages the NRPE service.

## Usage

###

Basic usage accepting all defaults (installation, configuration, managing the service, etcetera)

```puppet
include ::collectd
```

Although, if you would like to have more control over the service, you can pass parameters like this:

```puppet
class { '::collectd':
  package_ensure => latest,
  service_manage => false,
}
```

These settings can also be overridden by using Hiera

```yaml
collectd::service_manage: false
```

[build-img]: https://travis-ci.org/link0/puppet-collectd.svg
[build-url]: https://travis-ci.org/link0/puppet-collectd
[license-img]: https://img.shields.io/badge/license-MIT-blue.svg
[license-url]: https://github.com/link0/puppet-collectd/blob/master/LICENSE
[puppet-img]: https://img.shields.io/puppetforge/dt/link0/collectd.svg
[puppet-url]: https://forge.puppetlabs.com/link0/collectd
