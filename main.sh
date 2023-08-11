#!/bin/bash

# Function to print green text
function print_green() {
  echo -e "\033[1;32m$1\033[0m"
}

# Store the current directory
SCRIPT_DIR="$(pwd)"

# Remove old version of Go
print_green "Menghapus versi lama Go..."
yes | sudo apt-get remove golang-go
yes | sudo apt-get remove --auto-remove golang-go

# Install the new version of Go
print_green "Menginstall versi baru Go..."
sudo wget https://go.dev/dl/go1.21.0.linux-amd64.tar.gz
sudo tar -C /usr/local -xvf go1.21.0.linux-amd64.tar.gz

# Add Go binary directory to PATH
export PATH=$PATH:/usr/local/go/bin

clear; print_green "Penginstallan tools Bug Bounty\n=============================="; sleep 2

# Function to check if a tool is installed
function is_tool_installed() {
  if which "$1" &>/dev/null; then
    return 0  # Tool is installed
  else
    return 1  # Tool is not installed
  fi
}

# Change to the target directory
cd /home/parrot/Tools

# Update and Upgrade the system
print_green "Memperbarui paket dan sistem..."; sudo apt update && sudo apt upgrade

# ... rest of your installation code ...

# Instalasi selesai
cd "$SCRIPT_DIR"  # Navigate back to the main installation directory
clear; sleep 2; print_green "Instalasi selesai"
