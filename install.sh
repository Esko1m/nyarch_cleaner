#!/bin/bash

# Installer for NyArch Cleaner
# Must be run as root for system-wide install

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root (sudo)"
    exit 1
fi

echo "Installing NyArch Cleaner..."

# Check if cargo is installed
if ! command -v cargo &> /dev/null
then
    echo "Cargo not found! Installing Rust and Cargo via rustup..."
    
    # Install dependencies for rustup on Arch
    if ! command -v rustup &> /dev/null; then
        echo "Installing rustup..."
        pacman -S --noconfirm rustup
    fi

    # Initialize rustup (this installs cargo too)
    rustup install stable
    rustup default stable

    # Refresh shell environment
    export PATH="$HOME/.cargo/bin:$PATH"

    # Verify installation
    if ! command -v cargo &> /dev/null; then
        echo "Failed to install Cargo. Please install manually."
        exit 1
    fi
fi

# Build the project in release mode
echo "Building NyArch Cleaner from source..."
cargo build --release || { echo "Build failed!"; exit 1; }

# Copy binary to /usr/local/bin
echo "Copying binary to /usr/local/bin..."
cp target/release/nyarch_cleaner /usr/local/bin/nyarch_cleaner
chmod +x /usr/local/bin/nyarch_cleaner

# Optionally create a log folder in /var/log
echo "Creating log directory..."
mkdir -p /var/log/nyarch_cleaner
chmod 755 /var/log/nyarch_cleaner

echo "Installation complete!"
echo "You can now run 'nyarch_cleaner' from anywhere."
