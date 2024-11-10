wget https://github.com/neovim/neovim/releases/download/v0.10.0/nvim.appimage
chmod +x nvim.appimage
mv nvim.appimage /home/$USER/.local/bin

# Only attempt to set configuration if Neovim has never been run
if [ ! -d "$HOME/.config/nvim" ]; then
  # Use LazyVim
  git clone https://github.com/LazyVim/starter ~/.config/nvim

  # Disable update notification popup in starter config
  sed -i 's/checker = { enabled = true }/checker = { enabled = true, notify = false }/g' ~/.config/nvim/lua/config/lazy.lua

  # Make everything match the terminal transparency
  mkdir -p ~/.config/nvim/plugin/after
  cp ~/.local/share/${project}/configs/neovim/transparency.lua ~/.config/nvim/plugin/after/

  # Default to Gruvbox theme
  cp ~/.local/share/${project}/themes/gruvbox/neovim.lua ~/.config/nvim/lua/plugins/theme.lua

  # Set up supertab plugin
  cp ~/.local/share/${project}/configs/neovim/supertab.lua ~/.config/nvim/lua/plugins/supertab.lua

  # Set up keymaps
  cp ~/.local/share/${project}/configs/neovim/keymaps.lua ~/.config/nvim/lua/config/keymaps.lua

  # Enable default extras
  cp ~/.local/share/${project}/configs/neovim/lazyvim.json ~/.config/nvim/lazyvim.json

fi
