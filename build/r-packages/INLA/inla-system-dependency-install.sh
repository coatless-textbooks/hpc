#!/bin/bash
########################################################
# inla-system-dependency-install.sh
# Install System Dependency on Cluster for INLA
# Version 1.0.0
########################################################
# James Joseph Balamuta
# balamut2@illinois.edu
########################################################
# ## Example
#
# # Allow the installation script to work on the file system
# chmod +x inla-system-dependency-install.sh
#
# # Run the installer
# ./inla-system-dependency-install.sh
########################################################

# Declare software interested in using
software_names=( "udunits2" "tiff" "proj" "gdal" "geos" "gsl" )
software_versions=( "2.2.28" "4.3.0" "8.2.0" "3.4.0" "3.10.1" "2.7.1")
# TODO: Move over to key-value arrays?

# Establish location where custom modulefiles will be stored.
modulefiles_folder="/home/$USER/privatemodules"

# Establish location to store temporary downloads
tmp_download_folder="/home/$USER/tmp-download-scripts"

# Register path so that custom modulefiles are available for module
cat <<- EOF >> ~/.bashrc
export MODULEPATH=\$MODULEPATH:/home/\$USER/privatemodules
EOF

# Create directory pinned to user
mkdir -p /projects/stat/shared/$USER/software

# Download recipes
base_url="https://raw.githubusercontent.com/coatless-textbooks/hpc/master/docs/build"

# Get length of an array
n_software=${#software_names[@]}

# use for loop to read all values and indexes
for (( i=0; i<${n_software}; i++ ));
do

  active_software_name=${software_names[$i]}
  active_software_version=${software_versions[$i]}

  active_software=${active_software_name}/${active_software_version}

  # Create custom module location
  mkdir -p ${modulefiles_folder}/${active_software_name}

  # Download the modulefile
  wget -c ${base_url}/${active_software} \
       -O ${modulefiles_folder}/${active_software}

  # Establish a temporary download directory for software script
  mkdir -p ${tmp_download_folder}

  # Establish a location for the active script
  active_script="${tmp_download_folder}/${active_software_name}-${active_software_version}.sh"

  # Download the recipe script to obtain and install the required software
  wget -c ${base_url}/${active_software_name}/recipes/${active_software_version}.sh \
       -O ${active_script}

  # Set permissions to run
  chmod +x ${active_script}

  # Begin install process
  source ${active_script}

  # Load software in the cluster system.
  module load ${active_software}

  # Tidy up by removing tmp directory
  rm -rf ${tmp_download_folder}

done
