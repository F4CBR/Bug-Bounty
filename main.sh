#!/bin/bash

# Function to print green text
function print_green() {
  echo -e "\033[1;32m$1\033[0m"
}

# Store the current directory
SCRIPT_DIR="$(pwd)"

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

# install subfinder
if ! is_tool_installed "subfinder"; then
  clear; print_green "Menginstall Subfinder"; sleep 2; git clone https://github.com/projectdiscovery/subfinder.git && cd subfinder/v2/cmd/subfinder && go build . && sudo mv subfinder /usr/local/bin/
fi

# install httpx
if ! is_tool_installed "httpx"; then
  clear; print_green "Menginstall httpx"; sleep 2; git clone https://github.com/projectdiscovery/httpx.git && cd httpx/cmd/httpx && go build && sudo mv httpx /usr/local/bin/
fi

# install nuclei
if ! is_tool_installed "nuclei"; then
  clear; print_green "Menginstall Nuclei"; sleep 2; git clone https://github.com/projectdiscovery/nuclei.git && cd nuclei/v2/cmd/nuclei/ && go build . && sudo mv nuclei /usr/local/bin/ && nuclei -update-templates && nuclei -update
fi

# Install Paramspider
if ! is_tool_installed "paramspider"; then
  clear; print_green "Menginstall Paramspider"; sleep 2; git clone https://github.com/devanshbatham/ParamSpider.git && cd ParamSpider && pip3 install -r requirements.txt
  sudo ln -s "$(pwd)/paramspider.py" /usr/local/bin/paramspider
fi

# install dalfox
if ! is_tool_installed "dalfox"; then
  clear; print_green "Menginstall Dalfox"; sleep 2; git clone https://github.com/hahwul/dalfox && cd dalfox && go install && go build && sudo cp /home/parrot/go/bin/dalfox /usr/local/bin/
fi

# install kxss
if ! is_tool_installed "kxss"; then
  clear; print_green "Menginstall kxss"; sleep 2; git clone https://github.com/Emoe/kxss.git && cd kxss && go mod init kxss &>/dev/null && go mod tidy &>/dev/null && go get github.com/Emoe/kxss && go install github.com/Emoe/kxss
fi

# Instalasi selesai
cd "$SCRIPT_DIR"  # Navigate back to the main installation directory
clear; sleep 2; print_green "Instalasi selesai"
