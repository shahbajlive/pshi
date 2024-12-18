#!/bin/bash

# Exit the script if any command fails
set -e

git clone https://github.com/shahbajlive/pshi.git
cd pshi

# Create the models directory
echo "Creating 'models' directory..."
mkdir -p models

# Clone the Samurai repository into the models directory
echo "Cloning the Samurai repository..."
git clone https://github.com/yangchris11/samurai.git ./models/samurai
# Navigate to the Samurai directory
cd models/samurai

# Install the Samurai repository as an editable package
echo "Installing Samurai as an editable package..."
cd sam2
pip install -e .
pip install -e ".[notebooks]"

# Install additional dependencies
echo "Installing additional dependencies..."
pip install matplotlib==3.7 tikzplotlib jpeg4py opencv-python lmdb pandas scipy loguru

# Download and upgrade to the SAM 2.1 checkpoint
echo "Downloading SAM 2.1 checkpoints..."
cd checkpoints && ./download_ckpts.sh && cd ..

cd ../../..

echo "Setup completed successfully."