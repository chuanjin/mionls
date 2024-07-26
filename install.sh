# Exit immediately if a command exits with a non-zero status
set -e

# Needed for all installers
sudo pacman -S --noconfirm curl unzip gum

AVAILABLE_LANGUAGES=("Ruby on Rails" "Node.js" "Go" "Python" "Elixir" "Rust" "Java")
SELECTED_LANGUAGES="Go","Node.js","Python"
export FIRST_RUN_LANGUAGES=$(gum choose "${AVAILABLE_LANGUAGES[@]}" --no-limit --selected "$SELECTED_LANGUAGES" --height 10 --header "Select programming languages")

AVAILABLE_DBS=("MySQL" "Redis" "PostgreSQL")
SELECTED_DBS="PostgreSQL,Redis"
export FIRST_RUN_DBS=$(gum choose "${AVAILABLE_DBS[@]}" --no-limit --selected "$SELECTED_DBS" --height 5 --header "Select databases (runs in Docker)")

# Run terminal installers
for installer in ~/.local/share/${project}/install/*.sh; do source $installer; done

read -rp "Do you want to reboot your system now? (y/n): " choice

if [[ "$choice" =~ ^[Yy]$ ]]; then
	echo "Rebooting now..."
	sudo reboot
else
	echo "Reboot canceled. You need to manually reboot later."
fi
