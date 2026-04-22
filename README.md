# Steam Deck Secure Boot (Deck SB)
https://github.com/downthecrop/DeckSecureBoot

# rebase to this repository
sudo bootc switch ghcr.io/iimustangii1151/bazzite-deck-gnome:latest

# update system
ujust update

# TPM unlock
ujust setup-luks-tpm-unlock

# snapshot
ujust configure-snapshots

# disable automount steam
ujust enable-steam-automount

# flatpak

# gnome extenssions
