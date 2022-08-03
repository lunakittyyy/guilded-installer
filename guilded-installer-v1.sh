#!/bin/bash
# Check if the user is running the sh script under root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Keep things tidy
mkdir gld-tmp
cd gld-tmp
# Download and unpack the deb
wget https://www.guilded.gg/downloads/Guilded-Linux.deb
ar vx ./Guilded-Linux.deb
# Unpack the stuff we actually care about
tar -xf ./data.tar.xz
# Move the right stuff into the proper folders
cp -R ./opt/ /
cp -R ./usr/ /
# Clean everything up after done
cd ..
rm -R ./gld-tmp
