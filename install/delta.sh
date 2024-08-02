[ -f "$HOME/.gitconfig" ] && mv ~/.gitconfig{,.bak}
cp ~/.local/share/${project}/configs/.gitconfig ~/.gitconfig
