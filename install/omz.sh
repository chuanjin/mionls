echo no | sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

[ -f "~/.zshrc" ] && mv ~/.zshrc ~/.zshrc.bak
cp ~/.local/share/${project}/configs/zshrc ~/.zshrc
