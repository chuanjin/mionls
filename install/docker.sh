sudo pacman -S --quiet --noconfirm docker
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
