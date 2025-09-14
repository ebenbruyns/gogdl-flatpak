#!/bin/bash

cd ~/work/gogdl-flatpak
VERSION="25.08"

# ~/work/flatpak-builder-tools/pip/flatpak-pip-generator --runtime="org.freedesktop.Sdk//47' pypatch
~/work/flatpak-builder-tools/pip/flatpak-pip-generator --runtime="org.freedesktop.Sdk//${VERSION}" requests || exit
~/work/flatpak-builder-tools/pip/flatpak-pip-generator --runtime="org.freedesktop.Sdk//${VERSION}" pyinstaller || exit

# newer versions are broken so don't regen this
#~/work/flatpak-builder-tools/pip/flatpak-pip-generator --runtime="org.freedesktop.Sdk//${VERSION}" pywebview || exit

flatpak-builder gogdl com.github.heroic_games_launcher.heroic-gogdl.yml --force-clean  
flatpak-builder --user --install --force-clean gogdl com.github.heroic_games_launcher.heroic-gogdl.yml
flatpak build-bundle ~/.local/share/flatpak/repo gogdl.flatpak com.github.heroic_games_launcher.heroic-gogdl
