class playcontrol {
  include apache
  include apache::dnssd
  include apache::passenger

  include ruby::bundler
  include apt::tryphon::dev

  file { "/etc/playcontrol/database.yml":
    source => "$source_base/files/playcontrol/database.yml",
    require => Package[playcontrol]
  }
  file { "/etc/playcontrol/production.rb":
    source => "$source_base/files/playcontrol/production.rb",
    require => Package[playcontrol]
  }
  package { playcontrol:
    ensure => "1.0-1+build4",
    require => [Apt::Source['tryphon-dev'], Package['libapache2-mod-passenger']]
  }

  readonly::mount_tmpfs { "/var/lib/playcontrol": }

  file { "/etc/puppet/manifests/classes/playcontrol.pp":
    source => "puppet:///files/playcontrol/manifest.pp"
  }
}
