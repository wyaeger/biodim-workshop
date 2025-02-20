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
wget http://learnmetabarcoding.github.io/LearnMetabarcoding/data/sectionA.zip
wget http://learnmetabarcoding.github.io/LearnMetabarcoding/data/sectionB.zip
wget http://learnmetabarcoding.github.io/LearnMetabarcoding/data/sectionC.zip
wget http://learnmetabarcoding.github.io/LearnMetabarcoding/data/sectionD.zip
wget http://learnmetabarcoding.github.io/LearnMetabarcoding/data/sectionE.zip

# Unzip datasets
unzip sectionA.zip -d sectionA
unzip sectionB.zip -d sectionB
unzip sectionC.zip -d sectionC
unzip sectionD.zip -d sectionD
unzip sectionE.zip -d sectionE
rm sectionA.zip sectionB.zip sectionC.zip sectionD.zip sectionE.zip

# Install BLAST
BLAST_VERSION="2.11.0"
cd /usr/local/src/
sudo wget "ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/${BLAST_VERSION}/ncbi-blast-${BLAST_VERSION}+-x64-linux.tar.gz"
sudo tar -zxf ncbi-blast-${BLAST_VERSION}+-x64-linux.tar.gz
sudo cp ncbi-blast-${BLAST_VERSION}+/bin/* /usr/local/bin/

# Install bPTP
cd /usr/local/src
sudo git clone https://github.com/zhangjiajie/PTP
cd PTP
sudo -H python3 -m pip install -r requirements.txt
cd bin
for f in *.py; do sed -i "1s/python$/python3/" $f; done
sudo ln -s /usr/local/src/PTP/bin/bPTP.py /usr/local/bin/bPTP
sudo ln -s /usr/local/src/PTP/bin/PTP.py /usr/local/bin/PTP

# Install catfasta2phyml
sudo wget -O /usr/local/bin/catfasta2phyml.pl https://raw.githubusercontent.com/nylander/catfasta2phyml/master/catfasta2phyml.pl
sudo chmod a+x /usr/local/bin/catfasta2phyml.pl

# Install Cutadapt
sudo -H python3 -m pip install cutadapt

# Install extract_genes
sudo apt install -y bioperl libarray-utils-perl
sudo wget -O /usr/local/bin/extract_genes.pl https://raw.githubusercontent.com/tjcreedy/biotools/master/extract_genes.pl
sudo chmod a+x /usr/local/bin/extract_genes.pl

# Install FastTree
cd /usr/local/bin/
sudo wget http://www.microbesonline.org/fasttree/FastTree
sudo wget http://www.microbesonline.org/fasttree/FastTreeMP
sudo chmod a+x FastTree*

# Install FastQC
cd /usr/local/src/
sudo wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.9.zip
sudo unzip fastqc_v0.11.9.zip
sudo chmod a+x FastQC/fastqc
sudo ln -s /usr/local/src/FastQC/fastqc /usr/local/bin/fastqc

# Install FASTX Toolkit
cd /usr/local/src/
sudo wget https://github.com/agordon/libgtextutils/releases/download/0.7/libgtextutils-0.7.tar.gz
sudo tar -xzf libgtextutils-0.7.tar.gz
cd libgtextutils-0.7
sudo ./configure
sudo make
sudo make install
cd ../
sudo wget https://github.com/agordon/fastx_toolkit/releases/download/0.0.14/fastx_toolkit-0.0.14.tar.bz2
sudo tar -xjf fastx_toolkit-0.0.14.tar.bz2
cd fastx_toolkit-0.0.14
sudo ./configure
sudo make
sudo make install
cd ../

# Install MAFFT
sudo wget -P /usr/local/deb/ https://mafft.cbrc.jp/alignment/software/mafft_7.475-1_amd64.deb
sudo apt install -y /usr/local/deb/mafft_7.475-1_amd64.deb

# Install metaMATE
sudo -H python3 -m pip install metaMATE
sudo Rscript -e "install.packages(c('getopt', 'ape', 'fastcluster'), repos = 'https://cloud.r-project.org')"

# Install Pairfq
sudo curl -sL cpanmin.us | sudo perl - git://github.com/sestaton/Pairfq.git

# Install phylostuff
cd /usr/local/src
sudo git clone https://github.com/tjcreedy/phylostuff.git
cd phylostuff
sudo ./install.sh

# Install swarm
cd /usr/local/src
sudo git clone https://github.com/torognes/swarm.git
cd swarm/
sudo make
sudo cp bin/swarm /usr/local/bin/

# Install VSEARCH
cd /usr/local/src
sudo wget https://github.com/torognes/vsearch/archive/v2.15.1.tar.gz
sudo tar xzf v2.15.1.tar.gz
cd vsearch-2.15.1
sudo ./autogen.sh
sudo ./configure
sudo make
sudo make install

# Cleanup
sudo apt autoremove -y
sudo apt clean

echo "Setup complete!"
