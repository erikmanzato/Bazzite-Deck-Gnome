# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx
COPY build_files /

# Base Image
FROM ghcr.io/ublue-os/bazzite-deck-gnome:stable

## Other possible base images include:
# FROM ghcr.io/ublue-os/bazzite:latest
# FROM ghcr.io/ublue-os/bluefin-nvidia:stable
# 
# ... and so on, here are more base images
# Universal Blue Images: https://github.com/orgs/ublue-os/packages
# Fedora base image: quay.io/fedora/fedora-bootc:41
# CentOS base images: quay.io/centos-bootc/centos-bootc:stream10

### [IM]MUTABLE /opt
## Some bootable images, like Fedora, have /opt symlinked to /var/opt, in order to
## make it mutable/writable for users. However, some packages write files to this directory,
## thus its contents might be wiped out when bootc deploys an image, making it troublesome for
## some packages. Eg, google-chrome, docker-desktop.
##
## Uncomment the following line if one desires to make /opt immutable and be able to be used
## by the package manager.

# RUN rm /opt && mkdir /opt

### MODIFICATIONS
## make modifications desired in your image and install packages by modifying the build.sh script
## the following RUN directive does all the things required to run "build.sh" as recommended.

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build.sh

##################
   #REMOVE RPM
##################

RUN dnf5 remove -y \
    firewall-config \
    hhd-ui \
    lutris \
    nautilus-gsconnect \
    rom-properties-gtk4 \
    Sunshine \
    tailscale \
    waydroid \
    webapp-manager \
    && dnf5 autoremove -y

RUN rm -f /usr/share/applications/*waydroid*.desktop

##################
   #EXTENSIONS
##################

RUN rm -rf /usr/share/gnome-shell/extensions/*

RUN mkdir -p /etc/dconf/db/local.d && \
    echo "[org/gnome/shell]" > /etc/dconf/db/local.d/extensions && \
    echo "enabled-extensions=[" >> /etc/dconf/db/local.d/extensions && \
    echo "'Vitals@CoreCoding.com'," >> /etc/dconf/db/local.d/extensions && \
    echo "'gjsosk@vishram1123.com'," >> /etc/dconf/db/local.d/extensions && \
    echo "'AlphabeticalAppGrid@stuarthayhurst'," >> /etc/dconf/db/local.d/extensions && \
    echo "'appindicatorsupport@rgcjonas.gmail.com'," >> /etc/dconf/db/local.d/extensions && \
    echo "'add-to-steam@pupper.space'," >> /etc/dconf/db/local.d/extensions && \
    echo "'user-theme@gnome-shell-extensions.gcampax.github.com'," >> /etc/dconf/db/local.d/extensions && \
    echo "'blur-my-shell@aunetx'," >> /etc/dconf/db/local.d/extensions && \
    echo "'auto-power-profile@dmy3k.github.io'," >> /etc/dconf/db/local.d/extensions && \
    echo "'lockkeys@vaina.lt'," >> /etc/dconf/db/local.d/extensions && \
    echo "'dash-to-dock@micxgx.gmail.com'," >> /etc/dconf/db/local.d/extensions && \
    echo "'IP-Finder@linxgem33.com'," >> /etc/dconf/db/local.d/extensions && \
    echo "'auto-theme-switcher@amritashan.github.io'," >> /etc/dconf/db/local.d/extensions && \
    echo "'Bluetooth-Battery-Meter@maniacx.github.com'," >> /etc/dconf/db/local.d/extensions && \
    echo "'app-grid-tuner@m-lab'," >> /etc/dconf/db/local.d/extensions && \
    echo "'caffeine@patapon.info'," >> /etc/dconf/db/local.d/extensions && \
    echo "'ding@rastersoft.com'," >> /etc/dconf/db/local.d/extensions && \
    echo "'restartto@tiagoporsch.github.io'," >> /etc/dconf/db/local.d/extensions && \
    echo "'app-hider@lynith.dev']" >> /etc/dconf/db/local.d/extensions && \
    dconf update

##################
    #FLATPAK
##################

RUN flatpak uninstall -y --all || true

RUN flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
RUN flatpak install -y flathub \
com.github.derrod.legendary \
com.github.tchx84.Flatseal \
com.mattjakeman.ExtensionManager \
com.protonvpn.www \
com.rtosta.zapzap \
com.spotify.Client \
io.github.pwr_solaar.solaar \
io.github.vikdevelop.SaveDesktop \
io.gitlab.news_flash.NewsFlash \
it.mijorus.gearlever \
me.proton.Mail \
net.nokyan.Resources \
net.retrodeck.retrodeck \
org.gnome.Calculator \
org.gnome.Calendar \
org.gnome.FileRoller \
org.gnome.Firmware \
org.gnome.Geary \
org.gnome.Loupe \
org.gnome.NautilusPreviewer \
org.gnome.NetworkDisplays \
org.gnome.Papers \
org.gnome.Showtime \
org.gnome.TextEditor \
org.gnome.Weather \
org.gnome.baobab \
org.gnome.clocks \
org.gnome.seahorse.Application \
org.jellyfin.JellyfinDesktop \
org.libreoffice.LibreOffice \
org.localsend.localsend_app \
org.mozilla.firefox \
org.telegram.desktop \
page.tesk.Refine \
rocks.shy.VacuumTube \
ru.linux_gaming.PortProton

### LINTING
## Verify final image and contents are correct.
RUN bootc container lint
