#!/bin/bash
set -euxo pipefail

if [ ! -d "/root/.config/PyBitmessage" ]; then
  mkdir -p /root/.config/PyBitmessage
fi

if [ ! -f "/root/.config/PyBitmessage/keys.dat" ]; then
    envtpl -o /root/.config/PyBitmessage/keys.dat /root/keys.dat.tpl 
fi

exec "$@"
