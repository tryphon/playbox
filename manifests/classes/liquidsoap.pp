class liquidsoap {
  # TODO don't install recommended icecast2
  package { liquidsoap: }

  exec { "add-liquidsoap-user-to-audio-group":
    command => "adduser liquidsoap audio",
    unless => "grep '^audio:.*liquidsoap' /etc/group",
    require => Package[liquidsoap]
  }
}

class liquidsoap::readonly {
  include readonly::common
  include liquidsoap
  include liquidsoap::data

  file { "/var/log.model/liquidsoap":
    ensure => directory,
    owner => liquidsoap,
    require => Package[liquidsoap]
  }
  file { "/etc/init.d/liquidsoap":
    mode => 755,
    source => "$source_base/files/liquidsoap/liquidsoap.initd",
    require => Package[liquidsoap]
  }

  file { "/var/lib/liquidsoap":
    ensure => "/boot/data"
  }
  file { "/etc/liquidsoap/playbox.liq":
    ensure => "/var/lib/liquidsoap/playbox.liq",
    require => Package[liquidsoap]
  }
}

class liquidsoap::data {
  file { "/boot/data":
    ensure => directory
  }
  file { "/boot/data/tune.ogg":
    source => "$source_base/files/liquidsoap/tune.ogg"
  }
  file { "/boot/data/playbox.liq":
    source => "$source_base/files/liquidsoap/tune.liq"
  }
}
