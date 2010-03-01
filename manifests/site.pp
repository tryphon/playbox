import "defaults"
import "defines/*"
import "classes/*"

$source_base="/tmp/puppet"

file { "/etc/network/interfaces": 
   content => "auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp
"
}

# TODO replace by puppet boot
include readonly::initvarlog

include network::base
include network::dhcp::readonly
include network::ifplugd

include alsa::common
include liquidsoap::readonly
