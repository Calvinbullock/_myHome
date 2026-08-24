#!/bin/bash

# A script to manually invoke auto start apps if I want to not at all start ups

# --- Flatpaks ---
(flatpak run com.brave.Browser >/dev/null 2>&1 &)
(flatpak run com.discordapp.Discord >/dev/null 2>&1 &)

# --- System Natives / Debs ---
(alacritty >/dev/null 2>&1 &)
(steam >/dev/null 2>&1 &)
