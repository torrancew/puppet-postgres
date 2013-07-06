# == Class: postgres::service
#
# A class to manage the postgres service
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
class postgres::service(
  $service = $postgres::params::service,
) inherits postgres::params {
  Class['postgres::configure'] ~> Class['postgres::service']

  service {
    'postgres':
      name   => $service,
      ensure => running,
      enable => true;
  }
}

