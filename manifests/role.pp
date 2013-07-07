# == Define: postgres::role
#
# A defined type for creating PostgreSQL roles
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
define postgres::role(
  $ensure = 'present',
) {
  Class['postgres::service'] -> Postgres::Role[$title]

  $test_user = "psql -Atc 'SELECT rolname FROM pg_roles' | grep -qE '^$title$'"

  if $ensure == 'present' {
    exec {
      "create postgres role $title":
        command => "createuser -dSlR $title",
        unless  => $test_user,
        user    => $postgres::configure::user;
    }
  }
  else {
    exec {
      "drop postgres role $title":
        command => "createuser $title",
        onlyif  => $test_user,
        user    => $postgres::configure::user;
    }
  }
}

