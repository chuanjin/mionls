#!/bin/bash

echo "Fetching the latest BalenaEtcher AppImage URL..."
URL=$(curl -s https://api.github.com/repos/balena-io/etcher/releases/latest |
  grep browser_download_url | grep x64.AppImage | cut -d '"' -f 4)

# Check if the URL was successfully retrieved
if [ -z "$URL" ]; then
  echo "Error: Could not fetch the latest BalenaEtcher URL."
  echo "Please check your internet connection or try manually."
  exit 1
fi

echo "Downloading BalenaEtcher from: $URL"
wget -O balenaEtcher-x64.AppImage "$URL"

# Verify if the download was successful
if [ $? -ne 0 ]; then
  echo "Error: Failed to download BalenaEtcher. Please try again."
  exit 1
fi

echo "Making the AppImage executable..."
chmod u+x balenaEtcher-x64.AppImage

mv balenaEtcher-x64.AppImage ~/.local/bin/balenaEtcher
