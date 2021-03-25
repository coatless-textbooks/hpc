# Specify where jags install should be placed
jags_base=/projects/stat/shared/$USER/jags
 
# Create a download directory and switch into it
mkdir -p ${jags_base}/dl && cd "$_"
 
# Download from source forge
wget -c https://sourceforge.net/projects/mcmc-jags/files/JAGS/4.x/Source/JAGS-4.3.0.tar.gz -O - | tar -xz --strip-components=1
 
# Setup the compilation settings
./configure --prefix=${jags_base} --with-blas=-lblas --with-lapack=-llapack
# Compile
make
# Place compiled version into final directory
make install

# Go to home directory
cd ~/ # cd ~-  Go to old directory
# Remove jags download directory
rm -rf ${jags_base}/dl
 
# Place jags pkg-config info on path
export PKG_CONFIG_PATH=${jags_base}/lib/pkgconfig

# Install jags using r-path
Rscript -e "install.packages('rjags', repos='https://cloud.r-project.org/', configure.args='--enable-rpath')"
# Install runjags using r-path
Rscript -e "install.packages('runjags', repos='https://cloud.r-project.org/', configure.args='--enable-rpath')"
