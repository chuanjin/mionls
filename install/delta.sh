if [ -e .gitconfig ]; then
	mv ~/.gitconfig{,.bak}
fi
cp ~/.local/share/${project}/configs/.gitconfig ~/.gitconfig
