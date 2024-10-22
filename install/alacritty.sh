# Alacritty is a GPU-powered and highly extensible terminal. See https://alacritty.org/
sudo pacman -S alacritty
mkdir -p ~/.config/alacritty
cp ~/.local/share/${project}/configs/alacritty.toml ~/.config/alacritty/alacritty.toml
cp ~/.local/share/${project}/themes/tokyo-night/alacritty.toml ~/.config/alacritty/theme.toml
cp ~/.local/share/${project}/configs/alacritty/fonts/SauceCodePro.toml ~/.config/alacritty/font.toml
cp ~/.local/share/${project}/configs/alacritty/font-size.toml ~/.config/alacritty/font-size.toml
