# TODO move to site.pp (but didn't work in a first time)
$rsync_target="/var/lib/liquidsoap"

file { "/var/etc/rsync":
  ensure => directory,
  tag => boot
}
file { "/var/etc/rsync/rsync.default":
  content => "rsync_password=\"$rsync_password\"\nrsync_url=\"$rsync_url\"\nrsync_target=\"$rsync_target\"",
  tag => boot
}
file { "/var/etc/rsync/rsync.cron":
  content => template("/etc/puppet/templates/rsync.cron"),
  tag => boot
}
