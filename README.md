# Bitcoin Installation Script

Installs Bitcoin core or any base code forked coin with the same dependencies and build instructions as Bitcoin. The current repo added is BTG.

PLEASE NOTE: This script assumes you are running an older version of Ubuntu. For newer versions of Ubuntu, remove the following lines from install.sh.

```
# Update source endpoints (Only for older version of Ubuntu e.g. 15.10)
sudo cp /etc/apt/sources.list /etc/apt/sources.list.backup
sudo sed -i -e 's/us.archive/old-releases/g' /etc/apt/sources.list
sudo sed -i -e 's/security.ubuntu/old-releases.ubuntu/g' /etc/apt/sources.list
```

# Prerequisite
Ubuntu 15.10

# Install different Bitcoin Code
To install a forked version of Bitcoin or any coin based on Bitcoin and which has the same dependencies- update the following code to reflect the location of the zipped code.

```
# Get Bitcoin Repo
wget https://github.com/BTCGPU/BTCGPU/archive/v0.15.1.zip
unzip v0.15.1.zip
rm -rf v0.15.1.zip
```

# Run Installation
Run the install.sh file from within your home directory to start the installation.

```
./install.sh
```
