class liquidsoap::local {
  include liquidsoap::readonly
  include liquidsoap::data

  file { "/var/lib/liquidsoap":
    ensure => "/boot/data"
  }
  file { "/etc/liquidsoap/playbox.liq":
    ensure => "/var/lib/liquidsoap/playbox.liq",
    require => Package[liquidsoap]
  }

  liquidsoap::log { playbox: }
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
