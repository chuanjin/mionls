set -e

ascii_art='
        .__              .__
  _____ |__| ____   ____ |  |   ______
 /     \|  |/  _ \ /    \|  |  /  ___/
|  Y Y  \  (  <_> )   |  \  |__\___ \
|__|_|  /__|\____/|___|  /____/____  >
      \/               \/          \/
'

export project="mionls"
echo -e "$ascii_art"
echo "=> Mionls is for fresh Manjaro I3 OhMyZsh Neovim Lazyvim starter installations!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

sudo pacman -Syu
sudo pacman -S --noconfirm git >/dev/null

echo "Cloning stable ..."
rm -rf ~/.local/share/${project}
git clone https://github.com/chuanjin/${project}.git ~/.local/share/${project} >/dev/null

echo "Installation starting..."
source ~/.local/share/${project}/install.sh
