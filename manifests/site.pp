import "defaults"
import "classes/*"
import "config"

import "box"

$source_base="/tmp/puppet"

$box_name="playbox"
include box

$amixerconf_mode="playback"
include box::audio

include liquidsoap::readonly
