if [ ! -d "$HOME/.oh-my-zsh" ]; then
	echo no | sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
	git clone "https://github.com/zsh-users/zsh-autosuggestions" ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
else
	[ -f "$HOME/.zshrc" ] && mv ~/.zshrc ~/.zshrc.bak
	cp ~/.local/share/${project}/configs/zshrc ~/.zshrc
fi
