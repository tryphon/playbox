import "defaults"
import "classes/*"
import "config"

import "box"

$source_base="/tmp/puppet"

$box_config_host="playcentral.tryphon.eu"
$amixerconf_mode="playback"

include box
include puppet::download-config

include apache
include apache::dnssd

include liquidsoap::local
include volumepad::readonly

include rsync::cron

$release_cron_download_directory="/boot"
$release_cron_before_download="mount -o remount,rw /boot"
$release_cron_after_download="mount -o remount,ro /boot || /bin/true"
include release::cron
