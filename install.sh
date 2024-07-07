# Exit immediately if a command exits with a non-zero status
set -e

# Needed for all installers
sudo pacman -Syu curl git unzip

# Run terminal installers
for installer in ~/.local/share/mionls/install/*.sh; do source $installer; done
