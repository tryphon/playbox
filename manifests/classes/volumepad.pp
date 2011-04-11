class volumepad {
  file { "/etc/default/volumepadd":
    mode => 755,
    source => "$source_base/files/volumepad/volumepadd.default",
  }
  file { "/usr/local/bin/volumepad-control":
    mode => 755,
    source => "$source_base/files/volumepad/volumepad-control",
  }
  file { "/etc/local/bin/volumepadd":
    mode => 755,
    source => "$source_base/files/volumepad/volumepadd",
  }
  file { "/etc/udev/rules.d/10-volumepad.rules":
    mode => 755,
    source => "$source_base/files/volumepad/10-volumepad.rules",
    require => Package[udev]
  }
}

class liquidsoap::readonly {
  include readonly::common
  include volumepad
}
