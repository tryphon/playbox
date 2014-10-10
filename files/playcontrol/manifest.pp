file { "/var/lib/playcontrol/db":
  ensure => directory,
  owner => www-data,
  group => www-data,
  tag => boot
}

exec { "create-playcontrol-db":
  command => "install --owner=www-data --group=www-data --mode=664 /usr/share/playcontrol/db/production.sqlite3 /var/lib/playcontrol/db",
  creates => "/var/lib/playcontrol/db/production.sqlite3",
  require => File["/var/lib/playcontrol/db"],
  tag => boot
}
