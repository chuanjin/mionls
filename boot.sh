set -e

ascii_art='
        .__              .__
  _____ |__| ____   ____ |  |   ______
 /     \|  |/  _ \ /    \|  |  /  ___/
|  Y Y  \  (  <_> )   |  \  |__\___ \
|__|_|  /__|\____/|___|  /____/____  >
      \/               \/          \/
'

project="mionls"
echo -e "$ascii_art"
echo "=> Minls is for fresh Manjaro I3 OhMyZsh Neovim Lazyvim starter installations!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

sudo pacman -Syu --noconfirm >/dev/null
sudo pacman -S --noconfirm git >/dev/null

echo "Cloning stable ..."
rm -rf ~/.local/share/${project}
git clone https://github.com/chuanjin/${project}.git ~/.local/share/${project} >/dev/null

echo "Installation starting..."
source ~/.local/share/${project}/install.sh
