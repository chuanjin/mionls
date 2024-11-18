sudo pacman -S docker

sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
