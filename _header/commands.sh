#!/bin/bash
set -e
set -o pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
reset=$(tput rev)

echo ""
echo ""
echo "$(tput setaf 34).__"
echo "$(tput setaf 35)|  |__   ____   _____   ____   ____ _____    ____"
echo "$(tput setaf 36)|  |  \\ /  _ \\ /     \\_/ __ \\_/ __ \\\\__  \\  /    \\"
echo "$(tput setaf 37)|   Y  (  <_> )  Y Y  \\  ___/\\  ___/ / __ \\|   |  \\"
echo "$(tput setaf 38)|___|  /\\____/|__|_|  /\\___  >\\___  >____  /___|  /"
echo "$(tput setaf 39)     \\/             \\/     \\/     \\/     \\/     \\/"
echo "$(tput setaf 33)           https://homeean.de"

echo ""
echo ""
echo ""

sudo apt-get update
sudo apt-get -y upgrade

sudo apt-get install git build-essential unattended-upgrades -y
