#!/usr/bin/env bash

cd ~/Pictures/.
file="$(ls * | sort -R | tail -1)"
swww img "$file"