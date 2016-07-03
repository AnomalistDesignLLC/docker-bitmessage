# Bitmessage for Docker

[![Build Status](https://travis-ci.org/acejam/docker-bitmessage.svg?branch=basic-setup)](https://travis-ci.org/acejam/docker-bitmessage)
[![Docker Stars](https://img.shields.io/docker/stars/acejam/bitmessage.svg?maxAge=2592000)](https://hub.docker.com/r/acejam/bitmessage)
[![Docker Pulls](https://img.shields.io/docker/pulls/acejam/bitmessage.svg?maxAge=2592000)](https://hub.docker.com/r/acejam/bitmessage)

A Docker container for Bitmessage

## Quick Start

    docker run -d --name bitmessage --restart=always -v /data/bitmessage:/root/.config/PyBitmessage -p 8444:8444 -p 8442:8442 acejam/bitmessage:latest

## Data persistence

Coming soon!
