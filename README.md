## Bazzite Deck GNOME

[![Build Status](https://github.com/IIMustangII1151/Bazzite-Deck-Gnome/actions/workflows/build.yml/badge.svg)](https://github.com/IIMustangII1151/Bazzite-Deck-Gnome/actions/workflows/build.yml)
[![License](https://img.shields.io/badge/license-Apache%202.0-blue.svg)](https://github.com/IIMustangII1151/Bazzite-Deck-Gnome/blob/main/LICENSE)
[![GitHub last commit](https://img.shields.io/github/last-commit/IIMustangII1151/Bazzite-Deck-Gnome)](https://github.com/IIMustangII1151/Bazzite-Deck-Gnome/commits/main)

A custom Universal Blue [Bazzite](https://github.com/ublue-os/bazzite) image optimized for Steam Deck with GNOME desktop environment.

## Steam Deck Secure Boot (Deck SB)
https://github.com/downthecrop/DeckSecureBoot

## Rebase to this repository
```bash
sudo bootc switch ghcr.io/iimustangii1151/bazzite-deck-gnome:latest
```

## Available Commands (ujust)

- **ujust update** - Update the system
- **ujust setup-luks-tpm-unlock** - Setup LUKS TPM unlock
- **ujust toggle-password-feedback** - Toggle password feedback
- **ujust configure-grub** - Configure GRUB bootloader
- **ujust configure-snapshots** - Configure system snapshots
- **ujust setup-decky** - Setup Decky Loader


## Included Flatpak Applications

> flatpak install -y \
com.github.tchx84.Flatseal \
com.mattjakeman.ExtensionManager \
com.protonvpn.www \
com.rtosta.zapzap \
com.spotify.Client \
io.github.pwr_solaar.solaar \
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
ru.linux_gaming.PortProton

## GNOME Extensions

- **Vitals@CoreCoding.com**
- **gjsosk@vishram1123.com**
- **AlphabeticalAppGrid@stuarthayhurst**
- **appindicatorsupport@rgcjonas.gmail.com**
- **add-to-steam@pupper.space**
- **user-theme@gnome-shell-extensions.gcampax.github.com**
- **blur-my-shell@aunetx**
- **auto-power-profile@dmy3k.github.io**
- **lockkeys@vaina.lt**
- **dash-to-dock@micxgx.gmail.com**
- **IP-Finder@linxgem33.com**
- **auto-theme-switcher@amritashan.github.io**
- **Bluetooth-Battery-Meter@maniacx.github.com**
- **app-grid-tuner@m-lab**
- **caffeine@patapon.info**
- **ding@rastersoft.com**
- **restartto@tiagoporsch.github.io**
- **app-hider@lynith.dev**

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.
