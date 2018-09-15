# Bitcoin Installation Script

# Update system
sudo apt-get update -y

# Install git
sudo apt-get install git -y

# boostlib
sudo apt-get install libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev -y

# open ssl
sudo apt-get install libssl-dev -y

# libevent
sudo apt-get install libevent-dev -y

# cURL and LibTools
sudo apt-get install curl git build-essential libtool autotools-dev -y

# Setup python3 other utils
sudo apt-get install automake pkg-config bsdmainutils python3 -y

# Libx11
sudo apt-get install libx11-xcb-dev libfontconfig-dev -y


# Install Libsodium
wget https://download.libsodium.org/libsodium/releases/LATEST.tar.gz
tar -xf LATEST.tar.gz
rm -rf LATEST.tar.gz
cd libsodium-stable/
./configure
make && make check
sudo make install
cd ..
rm -rf libsodium-stable
sudo ln -s /usr/local/lib/libsodium.so.23 /usr/lib/libsodium.so.23

# Install unzip
sudo apt-get install unzip -y

# Get Bitcoin Repo
cd /home/$USER/
wget https://github.com/BTCGPU/BTCGPU/archive/v0.15.1.zip
unzip v0.15.1.zip
rm -rf v0.15.1.zip

# Go into Bitcoin Directory
cd BTCGPU-0.15.1

# Install Berkeleydb 4.8
/bin/sh /home/$USER/bitcoin-installation-script/berkeleydb-installation.sh `pwd`

# Install Berkleydb Dependency
sudo apt-get install libdb++-dev

# # Build
./autogen.sh
export BDB_PREFIX=/home/$USER/bitcoin-installation-script/BTCGPU-0.15.1/db4
./configure --prefix=/home/$USER/bitcoin-installation-script/BTCGPU-0.15.1/depends/x86_64-pc-linux-gnu/ BDB_LIBS="-L${BDB_PREFIX}/lib -ldb_cxx-5.3" BDB_CFLAGS="-I${BDB_PREFIX}/include" --enable-cxx --disable-shared --with-pic
make

cd ..
mv BTCGPU-0.15.1 /home/$USER/
cd /home/$USER/
