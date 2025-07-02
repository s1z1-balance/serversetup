#!/bin/bash

echo "Hello... Wait Please.."

if ! command -v wget &> /dev/null; then
    echo "wget not found. Installing wget..."

    if command -v apt-get &> /dev/null; then
        sudo apt-get update -qq && sudo apt-get install -y wget
    elif command -v yum &> /dev/null; then
        sudo yum install -y wget
    else
        echo "failed to define the packet manager"
        exit 1
    fi
fi 

mkdir "server paper 1.16.5"
echo "Create Dir 'server paper 1.16.5'"
cd "server paper 1.16.5" || exit 1

echo "Downloading server files..."

echo "Downloading Server Core..."
wget -q https://api.papermc.io/v2/projects/paper/versions/1.16.5/builds/794/downloads/paper-1.16.5-794.jar -O server.jar
echo "Downloading EULA..."
wget -q https://raw.githubusercontent.com/s1z1-balance/serversetup/main/eula.txt -O eula.txt
echo "Downloading Paper config..."
wget -q https://raw.githubusercontent.com/s1z1-balance/serversetup/main/paper.yml -O paper.yml
echo "Downloading Spigot config..."
wget -q https://raw.githubusercontent.com/s1z1-balance/serversetup/main/spigot.yml -O spigot.yml
echo "Downloading Bukkit config..."
wget -q https://raw.githubusercontent.com/s1z1-balance/serversetup/main/bukkit.yml -O bukkit.yml
echo "Downloading Start script..."
wget -q https://raw.githubusercontent.com/s1z1-balance/serversetup/main/start.sh -O start.sh

chmod +x start.sh 
echo "Server setup completed successfully!"

echo ""
read -p "Do you want to start the server now? (y/n): " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Starting server..."
    ./start.sh
else
    echo "Server setup complete. You can start the server later by running './start.sh' in the server directory."
    echo "Exiting..."
fi