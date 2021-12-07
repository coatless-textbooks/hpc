#!/bin/bash

# Setup variables
SOFTWARE_NAME="udunits"
SOFTWARE_VERSION_NUMBER=2.2.28
SOFTWARE_VERSION="${SOFTWARE_NAME}-${SOFTWARE_VERSION_NUMBER}"
SOFTWARE_DIR=~/project-stat/software/${SOFTWARE_NAME}/${SOFTWARE_VERSION_NUMBER}
SOFTWARE_TAR="$SOFTWARE_VERSION.tar.gz"
SOFTWARE_DL_DIR=~/project-stat/tmp
SOFTWARE_BUILD_DIR=$SOFTWARE_DL_DIR/${SOFTWARE_NAME}-build
SOFTWARE_URL=ftp://ftp.unidata.ucar.edu/pub/udunits/${SOFTWARE_TAR}

# Load modules used to compile libevent
module load gcc/7.2.0
module load libxml2/2.9.1

# Construct a temporary directory
mkdir -p $SOFTWARE_DL_DIR
cd $SOFTWARE_DL_DIR

# Download software
wget -c $SOFTWARE_URL -O $SOFTWARE_TAR

# Construct a home for software
mkdir -p $SOFTWARE_DIR

# Construct a build directory
mkdir -p $SOFTWARE_BUILD_DIR

# Extract software
tar -xzf $SOFTWARE_TAR --strip-components 1 -C ${SOFTWARE_BUILD_DIR}

# Switch into build directory
cd ${SOFTWARE_BUILD_DIR}

# Configure with a local scope
./configure --prefix=${SOFTWARE_DIR}

# Compile
make -j2
# Move
make install

# Remove the temporary directory
rm -rf $SOFTWARE_DL_DIR

# Return to home
cd ~/

