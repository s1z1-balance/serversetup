#!/bin/bash

echo "Hello... Wait Please.."

sudo apt update && sudo apt upgrade
sudo apt install wget 

mkdir server (paper 1.16.5)
echo "Create Dir 'server (paper 1.16.5)'"
cd server (paper 1.16.5)

wget https://api.papermc.io/v2/projects/paper/versions/1.16.5/builds/794/downloads/paper-1.16.5-794.jar -O server.jar
wget https://raw.githubusercontent.com/s1z1-balance/serversetup/refs/heads/main/eula.txt
wget https://raw.githubusercontent.com/s1z1-balance/serversetup/refs/heads/main/paper.yml
wget https://raw.githubusercontent.com/s1z1-balance/serversetup/refs/heads/main/spigot.yml
wget https://raw.githubusercontent.com/s1z1-balance/serversetup/refs/heads/main/bukkit.yml
wget https://raw.githubusercontent.com/s1z1-balance/serversetup/refs/heads/main/start.sh

chmod +x start.sh 

echo "Server JAR + Configs download"
