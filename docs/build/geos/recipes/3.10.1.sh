#!/bin/bash

# Setup variables
SOFTWARE_NAME="geos"
SOFTWARE_VERSION_NUMBER=3.10.1
SOFTWARE_VERSION="${SOFTWARE_NAME}-${SOFTWARE_VERSION_NUMBER}"
SOFTWARE_DIR_ROOT=~/project-stat/software
SOFTWARE_DIR=${SOFTWARE_DIR_ROOT}/${SOFTWARE_NAME}/${SOFTWARE_VERSION_NUMBER}
SOFTWARE_TAR="$SOFTWARE_VERSION.tar.bz2"
SOFTWARE_DL_DIR=~/project-stat/tmp
SOFTWARE_BUILD_DIR=$SOFTWARE_DL_DIR/${SOFTWARE_NAME}-build
SOFTWARE_URL=http://download.osgeo.org/geos/${SOFTWARE_TAR}

# Load modules used to compile libevent
module load gcc/7.2.0       # cluster
module load cmake/3.18.4    # cluster
module load libxml2/2.9.1   # cluster
module load sqlite/3.25.2   # cluster
module load udunits2/2.2.28 # custom
module load tiff/4.3.0      # custom
module load proj/8.2.0      # custom

# Construct a temporary directory
mkdir -p $SOFTWARE_DL_DIR
cd $SOFTWARE_DL_DIR

# Download software
wget -c $SOFTWARE_URL -O $SOFTWARE_TAR

# Construct a home for software
mkdir -p $SOFTWARE_DIR

# Construct a build directory
mkdir -p $SOFTWARE_BUILD_DIR

# Extract software (note, not in gzip formate, dropped the `z` option)
tar -xf $SOFTWARE_TAR --strip-components 1 -C ${SOFTWARE_BUILD_DIR}

# Switch into build directory
cd ${SOFTWARE_BUILD_DIR}

# Set up the build with a local scope
cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=${SOFTWARE_DIR}

# Compile
make -j2

# Move
make install

# Remove the temporary directory
rm -rf $SOFTWARE_DL_DIR

# Return to home
cd ~/

