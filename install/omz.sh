sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

zsh -c "
  [ -f "~/.zshrc" ] && mv ~/.zshrc ~/.zshrc.bak
  cp ~/.local/share/${project}/configs/zshrc ~/.zshrc
"
