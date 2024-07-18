# Exit immediately if a command exits with a non-zero status
set -e

# Needed for all installers
sudo pacman -S --noconfirm curl unzip

# Run terminal installers
for installer in ~/.local/share/${project}/install/*.sh; do source $installer; done
