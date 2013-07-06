# == Class: postgres::install
#
# A class for installing postgres
#
# === Parameters:
#
# None
#
# === Variables:
#
# None
#
# === Examples:
#
# None
#
# === Authors:
#
# * Tray Torrance
#
# === Copyright:
#
# Copyright 2013, Tray Torrance
# unless otherwise noted.
#
class postgres::install(
  $package = $postgres::params::package,
  $version = $postgres::params::version,
) inherits postgres::params {
  package {
    'postgres':
      name   => $package,
      ensure => $version;
  }
}

