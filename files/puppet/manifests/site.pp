# Defaults

Exec { 
  path => "/usr/bin:/usr/sbin/:/bin:/sbin:/usr/local/bin:/usr/local/sbin" 
}

File { 
  checksum => md5, owner => root, group => root
}

import "config.pp"
import "classes/*.pp"

# Use tag boot for resources required at boot (network files, etc ..)

file { "/var/etc/network":
  ensure => directory,
  tag => boot
}

file { "/var/etc/network/interfaces":
  content => template("/etc/puppet/templates/interfaces"),
  notify => Exec["restart-networking"],
  tag => boot
}

file { "/etc/network/interfaces":
  ensure => "/var/etc/network/interfaces"
}

exec { "restart-networking": 
  command => "/sbin/ifdown eth0 && /sbin/ifup eth0",
  refreshonly => true
}

exec { "copy-var-model":
  creates => "/var/log/dmesg",
  command => "cp -a /var/log.model/* /var/log/",
  tag => boot
}
