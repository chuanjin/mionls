sudo pacman -S --quiet --noconfirm docker docker-buildx
sudo usermod -aG docker "${USER}"
sudo systemctl start docker
sudo systemctl enable docker
