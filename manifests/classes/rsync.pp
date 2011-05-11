class rsync::cron {
  include rsync

  file { "/etc/puppet/manifests/classes/rsync.pp":
    source => "puppet:///files/rsync/manifest.pp"
  }
  file { "/etc/puppet/templates/rsync.cron":
    source => "puppet:///files/rsync/rsync.cron"
  }
  file { "/usr/local/sbin/rsync-box":
    source => "puppet:///files/rsync/rsync-box",
    mode => 755
  }

  file { "/etc/default/rsync":
    ensure => "/var/etc/rsync/rsync.default"
  }
  file { "/etc/cron.d/rsync":
    ensure => "/var/etc/rsync/rsync.cron",
    require => Package[cron]
  }
}
