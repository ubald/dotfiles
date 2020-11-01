#!/usr/bin/env bash
set -e

BASE_DIR=$PWD

# Generate SSH Key
ssh-keygen -t rsa -b 4096 -C "ubald@ubaldesign.com"

source setup/linux_base.sh

# TODO: Bat
# TODO: Toilet