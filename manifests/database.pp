# == Define: postgres::database
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
define postgres::database(
  $owner      = $postgres::params::default_user,
  $encoding   = $postgres::params::default_encoding,
  $template   = $postgres::params::default_template,
  $tablespace = $postgres::params::default_tablespace,
) {
  Class['postgres::service'] -> Postgres::Database[$title]

  exec {
    "create postgres database $title":
      command => "createdb -D $tablespace -E $encoding -O $owner -T $template $title",
      unless  => "psql -c 'SELECT datname FROM pg_database' | grep -qE '^$title$'",
      user    => $postgres::configure::user;
  }
}

