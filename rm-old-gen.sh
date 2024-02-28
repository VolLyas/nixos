#!/usr/bin/env bash
nix-collect-garbage  --delete-old
# recommeneded to sometimes run as sudo to collect additional garbage
nix-collect-garbage -d
# As a separation of concerns - you will need to run this command to clean out boot
/run/current-system/bin/switch-to-configuration boot