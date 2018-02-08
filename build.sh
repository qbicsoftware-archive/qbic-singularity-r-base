#!/bin/bash
#This is required to build the stuff

set -euo pipefail

PKSLIST=/tmp/rpackages.txt

#Add here what kind of dependencies you need in general
#Check for packages here: https://pkgs.alpinelinux.org/packages
apk --update add bash wget curl build-base gcc git ca-certificates gfortran perl

mkdir /build

cd /build

RMAJOR=3
RVERSION=3.2.5

# Download R
wget https://cloud.r-project.org/src/base/R-$RMAJOR/R-$RVERSION.tar.gz

#Run the installation here or in the Singularity file itself, no matter which one
tar -xzf *.tar.gz
cd R-$RVERSION

./configure --with-readline=no --with-x=no
make
make install

cat $PKSLIST | xargs -i sh -c 'R --vanilla <<EOF
install.packages("{}", repos="http://cran.us.r-project.org", dependencies=TRUE)
q()
EOF'


#Create mountpoints that we need
mkdir -p /lustre_cfc/qbic

#Clean up
rm -rf /var/cache/apk/*

cd /
rm -rf /build
