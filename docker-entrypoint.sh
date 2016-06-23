#!/bin/bash
set -eo pipefail

mkdir -p /root/.config/PyBitmessage

echo "[bitmessagesettings]
daemon = true
settingsversion = 10
port = 8444
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

exec "$@"
