#!/bin/bash
set -e

# Set up directories
sudo mkdir -p /usr/local/deb/
sudo mkdir -p /usr/local/src/
sudo mkdir -p /workspaces/biodim-workshop/data

# Update installed packages
sudo apt update && sudo apt upgrade -y

# Install some useful tools
sudo apt install -y rename zip unzip curl wget nano build-essential pkg-config autoconf \
    python3-pip perl-doc default-jre libgsl-dev libdbd-sqlite3-perl libxml2-dev libssl-dev \
    libcurl4-openssl-dev apt-transport-https r-base autoconf groff

# Download datasets
cd /workspaces/biodim-workshop/data
wget -q --show-progress http://learnmetabarcoding.github.io/LearnMetabarcoding/data/sectionA.zip
wget -q --show-progress http://learnmetabarcoding.github.io/LearnMetabarcoding/data/sectionB.zip
wget -q --show-progress http://learnmetabarcoding.github.io/LearnMetabarcoding/data/sectionC.zip
wget -q --show-progress http://learnmetabarcoding.github.io/LearnMetabarcoding/data/sectionD.zip
wget -q --show-progress http://learnmetabarcoding.github.io/LearnMetabarcoding/data/sectionE.zip

# Unzip datasets
unzip -o sectionA.zip -d sectionA
unzip -o sectionB.zip -d sectionB
unzip -o sectionC.zip -d sectionC
unzip -o sectionD.zip -d sectionD
unzip -o sectionE.zip -d sectionE
rm sectionA.zip sectionB.zip sectionC.zip sectionD.zip sectionE.zip

# Ensure FastQC is installed
sudo apt install -y fastqc

# Install VSEARCH
sudo apt install -y vsearch

# Install Cutadapt
sudo -H python3 -m pip install --upgrade cutadapt

# Install MAFFT
sudo apt install -y mafft

# Install FastTree
sudo apt install -y fasttree

# Install Pairfq
sudo apt install -y libdbd-sqlite3-perl
sudo curl -sL cpanmin.us | sudo perl - git://github.com/sestaton/Pairfq.git

# Install Swarm
cd /usr/local/src
sudo git clone https://github.com/torognes/swarm.git
cd swarm/
sudo make
sudo cp bin/swarm /usr/local/bin/

# Install metaMATE
sudo -H python3 -m pip install --upgrade metaMATE
sudo Rscript -e "install.packages(c('getopt', 'ape', 'fastcluster'), repos = 'https://cloud.r-project.org')"

# Verify installations
fastqc --version
blastn -version
vsearch --version
cutadapt --version
mafft --version
fasttree -help
pairfq --version
swarm --version
metaMATE --version

# Cleanup
sudo apt autoremove -y
sudo apt clean

echo "Setup complete!"

