#!/usr/bin/bash
echo "Running reflector to sort for fastest mirrors" | tee -a /tmp/axinstall-output.txt
pkexec reflector --latest 5 --sort rate --save /etc/pacman.d/mirrorlist | tee -a /tmp/axinstall-output.txt
pkexec axinstall-cli config ~/.config/axinstall.json | tee -a /tmp/axinstall-output.txt
