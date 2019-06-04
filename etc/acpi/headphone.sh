#!/bin/bash
set -euxo pipefail

enable() {
    card="sklnau8825adi"
    if [[ -e "/proc/asound/${card}" ]]; then
        alsaucm -c "${card}" set _verb HiFi set _enadev "$1"
    fi
}

if [[ "$1" == "jack/headphone HEADPHONE plug" ]]; then
    enable Headphone
elif [[ "$1" == "jack/headphone HEADPHONE unplug" ]]; then
    enable Speaker
fi
