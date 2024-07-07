set -e

ascii_art='
        .__       .__          
  _____ |__| ____ |  |   ______
 /     \|  |/    \|  |  /  ___/
|  Y Y  \  |   |  \  |__\___ \ 
|__|_|  /__|___|  /____/____  >
      \/        \/          \/ 
'

echo -e "$ascii_art"
echo "=> Minls is for fresh Manjaro I3 OhMyZsh Neovim Lazyvim starter installations!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

sudo pacman -Syu >/dev/null
sudo pacman -S git >/dev/null

echo "Cloning stable ..."
rm -rf ~/.local/share/minls
git clone -b stable https://github.com/chuanjin/mionls.git ~/.local/share/minls >/dev/null

echo "Installation starting..."
source ~/.local/share/minls/install.sh
