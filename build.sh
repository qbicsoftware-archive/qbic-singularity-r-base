#!/bin/bash
# Define the path to the rpackage file list
# Just a line separated list of package names,
# which can be resolved by Bioconductor
PKGLIST=/tmp/rpackages.txt

# Updae and upgrade the OS
apt update && apt upgrade -y 
# Install additional debian-based backages
apt install -y git ca-certificates

# Optional build directory, if you need to compile
# something from source
mkdir /build
cd /build

# Download and install biocLite core packages
cat $PKGLIST | xargs -i sh -c 'R --vanilla <<EOF
source("https://bioconductor.org/biocLite.R")
biocLite("{}", ask=FALSE)
q()
EOF'

# Create internal mountpoints that we need for CFC until we
# have a kernel with OverlayFS support
mkdir -p /sfs/7

# Clean up
apt clean

# Delete build directory
rm -rf /build