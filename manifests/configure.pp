# == Class: postgres::configure
#
# A class for configuring postgres
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
class postgres::configure {
  Class['postgres::install'] -> Class['postgres::configure']
}

