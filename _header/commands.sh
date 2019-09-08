#!/bin/bash
set -e
set -o pipefail

COLOR_RED="\033[0;31m"
COLOR_RED_LIGHT="\033[1;31m"
COLOR_GREEN="\033[0;32m"
COLOR_GREEN_LIGHT="\033[1;32m"
COLOR_ORANGE="\033[0;33m"
COLOR_YELLOW="\033[1;33m"
COLOR_BLUE="\033[0;34m"
COLOR_BLUE_LIGHT="\033[1;34m"
COLOR_PURPLE="\033[0;35m"
COLOR_PURPLE_LIGHT="\033[1;35m"
COLOR_CYAN="\033[0;36m"
COLOR_CYAN_LIGHT="\033[1;36m"
COLOR_GRAY="\033[1;30m"
COLOR_GRAY_LIGHT="\033[0;37m"
COLOR_BLACK="\033[0;30m"
COLOR_WHITE="\033[1;37m"
FORMAT_BOLD="\033[1m"
FORMAT_UNDERLINE="\033[4m"
FORMAT_END="\033[0m"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo ""
echo -e "${COLOR_BLUE}"
echo ".__"
echo "|  |__   ____   _____   ____   ____ _____    ____"
echo "|  |  \\ /  _ \\ /     \\_/ __ \\_/ __ \\\\__  \\  /    \\"
echo "|   Y  (  <_> )  Y Y  \\  ___/\\  ___/ / __ \\|   |  \\"
echo "|___|  /\\____/|__|_|  /\\___  >\\___  >____  /___|  /"
echo "     \\/             \\/     \\/     \\/     \\/     \\/"
echo "              https://homeean.de"

echo -e "${FORMAT_END}"
echo ""
echo ""

echo -e "${COLOR_ORANGE}Paketquellen aktualisieren und Updates installieren${FORMAT_END}"
sudo apt-get update
sudo apt-get -y upgrade

echo -e "${COLOR_ORANGE}Installiere Git und Build-Essentials${FORMAT_END}"
sudo apt-get install git build-essential curl -y
