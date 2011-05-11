class volumepad {
  file { "/etc/default/volumepadd":
    mode => 755,
    source => "$source_base/files/volumepad/volumepadd.default",
  }
  file { "/usr/local/bin/volumepad-control":
    mode => 755,
    source => "$source_base/files/volumepad/volumepad-control",
  }
  file { "/usr/local/bin/volumepadd":
    mode => 755,
    source => "$source_base/files/volumepad/volumepadd",
  }
  file { "/etc/udev/rules.d/10-volumepad.rules":
    mode => 755,
    source => "$source_base/files/volumepad/10-volumepad.rules",
    require => Package[udev]
  }
  file { "/etc/rc.local":
    mode => 755,
    source => "$source_base/files/etc/rc.local",
  }
  package { alsa-utils: }
  package { udev: }
  package { libdaemons-ruby: }
  include ruby::gems
}

class volumepad::readonly {
  include readonly::common
  include volumepad
}
