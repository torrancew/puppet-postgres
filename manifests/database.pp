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
  $owner      = getvar( 'postgres::params::default_user' ),
  $encoding   = getvar( 'postgres::params::default_encoding' ),
  $template   = getvar( 'postgres::params::default_template' ),
  $tablespace = getvar( 'postgres::params::default_tablespace' ),
) {
  Class['postgres::configure'] -> Postgres::Database[$title]
  Class['postgres::service']   -> Postgres::Database[$title]

  $test_db = "psql -Atc 'SELECT datname FROM pg_database' | grep -qe '^${title}$'"

  if $ensure == 'present' {
    exec {
      "create postgres database $title":
        command => "createdb -D $tablespace -E $encoding -O $owner -T $template $title",
        unless  => $test_db,
        user    => getvar( 'postgres::configure::user' );
    }
  } else {
    exec {
      "drop postgres database $title":
        command => "dropdb $title",
        onlyif  => $test_db,
        user    => getvar( 'postgres::configure::user' );
    }
  }
}

