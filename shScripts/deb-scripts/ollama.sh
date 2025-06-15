#!/bin/bash

# This script builds Ollama from source.
# Prerequisites: Go compiler (1.21+ recommended) and build-essential packages.
printf "\e[1;32m** [Ensuring build prerequisites are installed...] **\e[0m\n"

# Install necessary packages for Go-based build
sudo apt-get update
sudo apt-get install -y golang-go build-essential git

# Create and navigate to the build directory
mkdir -p "$HOME/Documents/build"
cd "$HOME/Documents/build" || { echo "Failed to change directory. Exiting."; exit 1; }

# Clone Ollama repository
printf "\e[1;32m** [Cloning Ollama repository...] **\e[0m\n"
git clone https://github.com/ollama/ollama.git
cd ollama || { echo "Failed to change directory to ollama. Exiting."; exit 1; }
git checkout v0.9.1

# Build Ollama for local user installation ($HOME/.local/bin)
printf "\e[1;32m** [Generating Go code and building Ollama binary...] **\e[0m\n"
go generate ./...
go build -o ollama .

# Install Ollama binary to $HOME/.local/bin
printf "\e[1;32m** [Installing Ollama to $HOME/.local/bin...] **\e[0m\n"
mkdir -p "$HOME/.local/bin"
mv ollama "$HOME/.local/bin/"

echo "Ollama build and local installation complete."
echo "Ensure $HOME/.local/bin is in your PATH to run 'ollama'."
