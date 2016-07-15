#!/bin/bash
set -eo pipefail

if [ ! -d "/root/.config/PyBitmessage" ]; then
  mkdir -p /root/.config/PyBitmessage
fi

if [ ! -f "/root/.config/PyBitmessage/keys.dat" ]; then
echo "[bitmessagesettings]
daemon = true
settingsversion = 10
port = 8444
apienabled = true
apiport = 8442
apiinterface = ${RPC_INTERFACE}
apiusername = ${RPC_USER}
apipassword = ${RPC_PASS}
apinotifypath = true
timeformat = %%a, %%d %%b %%Y  %%I:%%M %%p
blackwhitelist = black
startonlogon = false
minimizetotray = false
showtraynotifications = true
startintray = false
socksproxytype = none
sockshostname = localhost
socksport = 9050
socksauthentication = false
sockslisten = false
socksusername =
sockspassword =
keysencrypted = false
messagesencrypted = false
defaultnoncetrialsperbyte = 1000
defaultpayloadlengthextrabytes = 1000
minimizeonclose = false
maxacceptablenoncetrialsperbyte = 0
maxacceptablepayloadlengthextrabytes = 0
dontconnect = true
userlocale = system
useidenticons = True
identiconsuffix = FHd4F5Wa9LNP
replybelow = False
maxdownloadrate = 0
maxuploadrate = 0
ttl = 367200
stopresendingafterxdays =
stopresendingafterxmonths =
namecoinrpctype = namecoind
namecoinrpchost = localhost
namecoinrpcuser =
namecoinrpcpassword =
namecoinrpcport = 8336" > /root/.config/PyBitmessage/keys.dat
fi

exec "$@"
