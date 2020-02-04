#!/bin/sh
set -e

# Use the default config.
make od_gcw0_defconfig

# Clear the install location.
echo "Clearing install location..."
mkdir -p /opt/gcw0-toolchain
rm -rf /opt/gcw0-toolchain/*

# Clear the build location.
echo "Clearing build location..."
rm -rf output/

# Perform the build.
echo "Starting build..."
nice make

# Create packages.
echo "Creating packages..."
tar -C/opt --exclude='.fakeroot.*' -jcf opendingux-gcw0-toolchain.`date +'%Y-%m-%d'`.tar.bz2 gcw0-toolchain
