#!/bin/bash
#This is required to build the stuff

RMAJOR=3
RVERSION=3.2.3-4

#Add here what kind of dependencies you need in general
#Check for packages here: https://pkgs.alpinelinux.org/packages
apt update && apt upgrade -y && apt install -y bash wget curl gcc git ca-certificates r-base=$RVERSION libssl-dev libcurl4-openssl-dev libxml2-dev openjdk-8-jre

# Download nlopt, as this will be needed by some r packages
mkdir /build
cd /build

# Download and install biocLite core packages
sh -c 'R --vanilla <<EOF
source("https://bioconductor.org/biocLite.R")
biocLite()
q()
EOF'

#Create mountpoints that we need for CFC
mkdir -p /sfs/7

#Clean up
rm -rf /var/cache/apk/*

cd /
rm -rf /build
