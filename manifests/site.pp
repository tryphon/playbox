import "defaults"
import "classes/*"
import "config"

import "box"

$source_base="/tmp/puppet"

$box_name="playbox"
$box_config_host="playcentral.tryphon.eu"
$amixerconf_mode="playback"

include box
include puppet::download-config

include apache
include apache::dnssd

include liquidsoap::readonly
include volumepad::readonly
