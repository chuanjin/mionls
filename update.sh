set -e

export project="mionls"

sudo pacman -Syu
sudo yay

cd ~/.local/share/${project}
git stash && git pull origin main

AVAILABLE_LANGUAGES=("Ruby on Rails" "Node.js" "Go" "Python" "Elixir" "Rust" "Java")
SELECTED_LANGUAGES="Go","Node.js","Python"
export FIRST_RUN_LANGUAGES=$(gum choose "${AVAILABLE_LANGUAGES[@]}" --no-limit --selected "$SELECTED_LANGUAGES" --height 10 --header "Select programming languages")

AVAILABLE_DBS=("MySQL" "Redis" "PostgreSQL")
SELECTED_DBS="PostgreSQL,Redis"
export FIRST_RUN_DBS=$(gum choose "${AVAILABLE_DBS[@]}" --no-limit --selected "$SELECTED_DBS" --height 5 --header "Select databases (runs in Docker)")

for installer in ~/.local/share/${project}/install/*.sh; do source $installer; done

echo "Update Completed!"

cd -
