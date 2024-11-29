wget -O zellij.tar.gz "https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz"
tar -xf zellij.tar.gz zellij
sudo install zellij /usr/local/bin
rm zellij.tar.gz zellij

mkdir -p ~/.config/zellij/themes
[ ! -f "$HOME/.config/zellij/config.kdl" ] && cp ~/.local/share/${project}/configs/zellij.kdl ~/.config/zellij/config.kdl
cp ~/.local/share/${project}/themes/tokyo-night/zellij.kdl ~/.config/zellij/themes/tokyo-night.kdl
