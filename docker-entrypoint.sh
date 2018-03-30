#!/bin/bash
set -euxo pipefail

if [ ! -d "/root/.config/PyBitmessage" ]; then
  mkdir -p /root/.config/PyBitmessage
fi

if [ ! -f "/root/.config/PyBitmessage/keys.dat" ]; then
    envtpl /root/keys.dat.tpl > /root/.config/PyBitmessage/keys.dat
fi

exec "$@"
