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
  git clone https://github.com/devanshbatham/ParamSpider.git && cd ParamSpider && pip3 install .
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
  go install github.com/Emoe/kxss@latest 
  sudo cp /root/go/bin/kxss /usr/local/bin/kxss
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
  chmod +x Secretfinder.py
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
  mv ffuf /usr/local/bin/ffuf
  cd "$SCRIPT_DIR"  # Navigate back to the main installation directory
fi

# Install Freq
if ! is_tool_installed "freq"; then
  clear; print_green "Menginstall Freq"; sleep 2; 
  go install github.com/takshal/freq@latestt
  sudo cp /root/go/bin/freq /usr/local/bin/freq
fi

# Install qsreplace
if ! is_tool_installed "qsreplace"; then
  clear; print_green "Menginstall qsreplace"; sleep 2; 
  go install github.com/tomnomnom/qsreplace@latest
  sudo cp /root/go/bin/qsreplace /usr/local/bin/qsreplace
fi

# Install Shosubgo
if ! is_tool_installed "shosubgo"; then
  clear; print_green "Menginstall Shosubgo"; sleep 2; 
  go install github.com/incogbyte/shosubgo@latest
  sudo cp /root/go/bin/shosubgo /usr/local/bin/shosubgo
fi

# Install anew
if ! is_tool_installed "anew"; then
  clear; print_green "Menginstall anew"; sleep 2; 
  go install -v github.com/tomnomnom/anew@latest
  sudo cp /root/go/bin/anew /usr/local/bin/anew
fi

# Install gau
if ! is_tool_installed "gau"; then
  clear; print_green "Menginstall gau"; sleep 2; 
  go install github.com/lc/gau/v2/cmd/gau@latest
  sudo cp /root/go/bin/gau /usr/local/bin/gau
  wget https://raw.githubusercontent.com/lc/gau/master/.gau.toml
  mv "$(pwd)/.gau.toml" /root/.gau.toml
  cd "$SCRIPT_DIR"  # Navigate back to the main installation directory
fi

# Install urldedupe
if ! is_tool_installed "urldedupe"; then
  clear; print_green "Menginstall urldedupe"; sleep 2; 
  git clone https://github.com/ameenmaali/urldedupe.git && cd urldedupe
  apt install cmake && cmake CMakeLists.txt && make
  mv "$(pwd)/urldedupe" /usr/local/bin/urldedupe
  cd "$SCRIPT_DIR"  # Navigate back to the main installation directory
fi

# Setup Gf-Patterns
if [ ! -d "/root/.gf" ]; then
  clear; print_green "Mengsetup Gf-Patterns"; sleep 2;
  git clone https://github.com/emadshanab/Gf-Patterns-Collection.git && cd Gf-Patterns-Collection
  chmod +x set-all.sh && ./set-all.sh
  cd "$SCRIPT_DIR"  # Kembali ke direktori utama instalasi
fi

# Instalasi selesai
clear; sleep 2; print_green "Instalasi selesai"
