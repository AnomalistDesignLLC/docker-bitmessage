# Bitmessage for Docker

An Alpine Docker container for PyBitmessage

## Quick Start

    `git clone git@github.com:AnomalistDesignLLC/docker-bitmessage.git`
    `cd docker-bitmessage`
    `docker build . -t adllc/bitmessage`
    `docker run -d --name bitmessage --restart=always -v /data/bitmessage:/root/.config/PyBitmessage -p 8444:8444 -p 8442:8442 adllc/bitmessage:latest`

## Config options

This container includes support for various Bitmessage configuration values. These values can be set when calling `docker run` through the use of environment variables.

The following values are configurable:

* `RPC_USER`
* `RPC_PASS`
* `RPC_INTERFACE`

For example, to run the container with the username "DevUser" and a password of "P@ssw0rd123", you can run the following:

      `docker run -d -e RPC_USER="DevUser" -e RPC_PASS="P@ssw0rd123" adllc/bitmessage:latest`

## Data persistence

Coming soon!
