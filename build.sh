#!/bin/bash
set -e

echo "=== Setting up Buildroot build ==="

# Clone buildroot submodule if needed
if [ ! -d "buildroot/.git" ]; then
    git submodule update --init --recursive
fi

cd buildroot

# Load config from base_external
cp ../base_external/configs/piassistant_defconfig .config
make BR2_EXTERNAL=../base_external olddefconfig

# Build
echo "Starting build..."
make BR2_EXTERNAL=../base_external -j$(nproc)

echo "=== Build complete! ==="
echo "Image: output/images/sdcard.img"
