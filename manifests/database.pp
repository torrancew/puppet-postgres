# == Define: postgres::database
#
# A defined type for creating PostgreSQL databases
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
  $ensure     = present,
  $owner      = $postgres::params::default_user,
  $encoding   = $postgres::params::default_encoding,
  $template   = $postgres::params::default_template,
  $tablespace = $postgres::params::default_tablespace,
) {
  Class['postgres::service'] -> Postgres::Database[$title]

  $test_db = "psql -c 'SELECT datname FROM pg_database' | grep -qe '^${title}$'"

  if $ensure == 'present' {
    exec {
      "create postgres database $title":
        command => "createdb -D $tablespace -E $encoding -O $owner -T $template $title",
        unless  => $test_db,
        user    => $postgres::configure::user;
    }
  } else {
    exec {
      "drop postgres database $title":
        command => "dropdb $title",
        onlyif  => $test_db,
        user    => $postgres::configure::user;
    }
  }
}

