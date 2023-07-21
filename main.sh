#!/bin/bash

clear
echo "Penginstallan tools Bug Bounty"
echo "=============================="
sleep 2

# Update and Upgrade the system
clear
echo "Memperbarui paket dan sistem..."
sudo apt update -y
sudo apt upgrade -y

# install subfinder
clear
echo "Menginstall Subfinder"
sleep 2
git clone https://github.com/projectdiscovery/subfinder.git
cd subfinder/v2/cmd/subfinder
go build .
mv subfinder /usr/local/bin/

# install httpx
clear
echo "Menginstall httpx"
sleep 2
git clone https://github.com/projectdiscovery/httpx.git; cd httpx/cmd/httpx; go build; mv httpx /usr/local/bin/

# install nuclei
clear
echo "Menginstall Nuclei"
sleep 2
git clone https://github.com/projectdiscovery/nuclei.git
cd nuclei/v2/cmd/nuclei/
go build .
mv nuclei /usr/local/bin/
nuclei -update-templates
nuclei -update

# Install Paramspider
clear
echo "Menginstall Paramspider"
sleep 2
git clone https://github.com/devanshbatham/ParamSpider.git
cd ParamSpider
pip3 install -r requirements.txt

# install dalfox
clear
echo "Menginstall Dalfox"
sleep 2
git clone https://github.com/hahwul/dalfox
cd dalfox
go install
go build
cp /home/parrot/go/bin/dalfox /usr/local/bin

# install kxss
clear
echo "Menginstall kxss"
sleep 2
git clone https://github.com/Emoe/kxss.git
cd kxss
go mod init kxss
go get github.com/Emoe/kxss

# Instalasi selesai
clear
sleep 2
echo "Instalasi selesai"
