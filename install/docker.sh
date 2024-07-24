sudo pacman -S --quiet --noconfirm docker
sudo usermod -aG docker "${USER}"
sudo systemctl start docker
