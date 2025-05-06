#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y tmux 

#Install Flatpak packages
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y --noninteractive flathub app.zen_browser.zen
flatpak install -y --noninteractive flathub com.nextcloud.desktopclient.nextcloud
flatpak install -y --noninteractive flathub org.libreoffice.LibreOffice
flatpak install -y --noninteractive flathub org.telegram.desktop
flatpak install -y --noninteractive flathub io.mpv.Mpv

# Очистка кэша (опционально)
flatpak uninstall --unused -y

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
