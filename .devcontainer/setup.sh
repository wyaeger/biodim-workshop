#!/bin/bash
set -e

# Update system
sudo apt update && sudo apt upgrade -y

# Install bioinformatics tools
sudo apt install -y git curl wget nano \
    python3 python3-pip \
    fastqc bowtie2 samtools bcftools \
    bedtools blast

# Install Python packages
pip3 install biopython pandas numpy matplotlib seaborn

echo "Setup complete!"
