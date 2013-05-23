import "defaults"
import "classes/*"
import "config"

import "box"

$source_base="/tmp/puppet"

include box

$amixerconf_mode="playback"
include box::audio

# /tmp is too small in PlayBox
file { "/etc/box/local.d/release-in-boot.rb":
  content => "Box::Release.download_directory = '/boot'
Box::Release.before_download_command = 'mount -o remount,rw /boot'
Box::Release.after_download_command = 'mount -o remount,ro /boot || /bin/true'
"
}

include apache
include apache::dnssd

include network::wifi

include liquidsoap::local
include volumepad::readonly

include rsync::cron
