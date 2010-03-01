import "defaults"
import "defines/*"
import "classes/*"

$source_base="/tmp/puppet"

$box_name="playbox"

# TODO replace by puppet boot
include readonly::initvarlog

include network
include network::interfaces::deprecated

include alsa::common
include liquidsoap::readonly
