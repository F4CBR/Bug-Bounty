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

# Update and Upgrade the system
print_green "Memperbarui paket dan sistem..."; sudo apt update && sudo apt upgrade

# Install Go
if ! which go &>/dev/null; then
  clear; print_green "Menginstall Go..."; sleep 2;
  sudo rm /usr/lib/python3.11/EXTERNALLY-MANAGED
  sudo wget https://go.dev/dl/go1.22.6.linux-amd64.tar.gz
  sudo tar -C /usr/local -xvf go1.22.6.linux-amd64.tar.gz
  echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
  source ~/.bashrc
fi

# Install Subfinder
if ! is_tool_installed "subfinder"; then
  clear; print_green "Menginstall Subfinder"; sleep 2; 
  go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
  sudo cp /root/go/bin/subfinder /usr/local/bin/subfinder
fi

# Install httpx
if ! is_tool_installed "httpx"; then
  clear; print_green "Menginstall httpx"; sleep 2; 
  go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
  sudo cp /root/go/bin/httpx /usr/local/bin/httpx
fi

# Install nuclei
if ! is_tool_installed "nuclei"; then
  clear; print_green "Menginstall Nuclei"; sleep 2; 
  go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
  sudo cp /root/go/bin/nuclei /usr/local/bin/nuclei
  nuclei -update-templates && nuclei -update
fi

# Install Paramspider
if ! is_tool_installed "paramspider"; then
  clear; print_green "Menginstall Paramspider"; sleep 2; 
  git clone https://github.com/devanshbatham/ParamSpider.git && 
  cd ParamSpider && pip3 install .
  sudo ln -s "$(pwd)/paramspider.py" /usr/local/bin/paramspider
  cd "$SCRIPT_DIR"  # Navigate back to the main installation directory
fi

# Install dalfox
if ! is_tool_installed "dalfox"; then
  clear; print_green "Menginstall Dalfox"; sleep 2; 
  go install github.com/hahwul/dalfox/v2@latest
  sudo cp /root/go/bin/dalfox /usr/local/bin/dalfox
fi

# Install kxss
if ! is_tool_installed "kxss"; then
  clear; print_green "Menginstall kxss"; sleep 2; 
  git clone https://github.com/Emoe/kxss.git && 
  cd kxss && go mod init kxss &>/dev/null && go mod tidy &>/dev/null && 
  go get github.com/Emoe/kxss && go install github.com/Emoe/kxss && sudo cp "$(pwd)/go/bin/kxss" /usr/local/go/bin/kxss
  cd "$SCRIPT_DIR"  # Navigate back to the main installation directory
fi

# Install katana
if ! is_tool_installed "katana"; then
  clear; print_green "Menginstall Katana"; sleep 2; 
  go install github.com/projectdiscovery/katana/cmd/katana@latest
  sudo cp /root/go/bin/katana /usr/local/bin/katana
fi

# Install LinkFinder
if ! is_tool_installed "linkfinder"; then
  clear; print_green "Menginstall Linkfinder"; sleep 2; 
  git clone https://github.com/GerbenJavado/LinkFinder.git
  cd LinkFinder && pip3 install -r requirements.txt && python3 setup.py install
  sudo ln -s "$(pwd)/linkfinder.py" /usr/local/bin/linkfinder
  cd "$SCRIPT_DIR"  # Navigate back to the main installation directory
fi

# Install secretfinder
if ! is_tool_installed "secretfinder"; then
  clear; print_green "Menginstall Secretfinder"; sleep 2; 
  git clone https://github.com/m4ll0k/SecretFinder.git secretfinder
  cd secretfinder && python -m pip install -r requirements.txt or pip install -r requirements.txt
  sudo ln -s "$(pwd)/Secretfinder.py" /usr/local/bin/secretfinder
  cd "$SCRIPT_DIR"  # Navigate back to the main installation directory
fi

# Install Sublist3r
if ! is_tool_installed "sublist3r"; then
  clear; print_green "Menginstall Sublist3r"; sleep 2; 
  git clone https://github.com/aboul3la/Sublist3r.git
  cd Sublist3r && pip install -r requirements.txt && pip install requests dnspython argparse && python3 setup.py install
  sudo ln -s "$(pwd)/sublist3r.py" /usr/local/bin/sublist3r
  cd "$SCRIPT_DIR"  # Navigate back to the main installation directory
fi

# Install Waybackurls
if ! is_tool_installed "waybackurls"; then
  clear; print_green "Menginstall Waybackurls"; sleep 2; 
  go install github.com/tomnomnom/waybackurls@latest
  sudo cp /root/go/bin/waybackurls /usr/local/bin/waybackurls
fi

# Install FFUF
if ! is_tool_installed "ffuf"; then
  clear; print_green "Menginstall FFUF"; sleep 2; 
  git clone https://github.com/ffuf/ffuf 
  cd ffuf && go get && go build
  sudo ln -s "$(pwd)/ffuf.py" /usr/local/bin/ffuf
  cd "$SCRIPT_DIR"  # Navigate back to the main installation directory
fi

# Instalasi selesai
clear; sleep 2; print_green "Instalasi selesai"
