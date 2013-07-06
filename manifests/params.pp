# == Class: postgres::params
#
# A class storing default parameters for the postgres module
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
class postgres::params {
  ## Installation Parameters
  $package = 'postgresql'
  $version = 'installed'

  ## Configuration Parameters
  $user = 'postgres'

  $default_user       = 'postgres'
  $default_encoding   = 'UTF8'
  $default_template   = 'template0'
  $default_tablespace = 'pg_default'

  ## Service Parameters
  $service = 'postgresql'
}

