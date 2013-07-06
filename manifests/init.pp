# == Class: postgres
#
# The postgres module
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
class postgres {
  class { 'postgres::install': }
  class { 'postgres::configure': }
  class { 'postgres::service': }

  anchor { 'postgres::begin': } -> Class['postgres::install']
  Class['postgres::service']    -> anchor { 'postgres::end': }
}

