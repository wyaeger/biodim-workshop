# biodim-workshop
Repo for the metagenomics workshop at the BIODIM/SATREPS molecular techniques course, taught at UNAS in February 2025.

This workshop uses data and code from the **[Bioinformatic Methods for Biodiversity Metabarcoding tutorial]([url](https://learnmetabarcoding.github.io/LearnMetabarcoding/index.html))**


**Instructions for Students to Access the GitHub Codespace:**

Welcome to the bioinformatics workshop! To access and work within the pre-configured coding environment, follow the steps below:

**1. Ensure You Have a GitHub Account.** Before accessing the Codespace, you need a GitHub account. If you don’t already have one, sign up at https://github.com/.

**2. Access the Workshop Repository.** Open a web browser and navigate to the GitHub repository containing the workshop materials.
Click the "Code" button near the top right of the repository page.
Select the "Codespaces" tab.
Click "Create codespace on main" (or a different branch if instructed).

**3. Wait for the Codespace to Initialize.** The Codespace may take a couple of minutes to set up.
Once loaded, you will see a VS Code interface running in your browser.

**4. Verify the Setup.** To ensure everything is installed correctly:
Open the terminal in the Codespace by clicking "Terminal" > "New Terminal" from the menu bar.
Run the following command to check for installed tools:
fastqc --version
blastn -version
vsearch --version

Navigate to the dataset directory:
cd /workspaces/biodim-workshop/data
ls

You should see the downloaded and extracted dataset files.

**5. Running Bioinformatics Commands.** Use the terminal to run bioinformatics tools such as FastQC, BLAST, and VSEARCH.
Example command:
fastqc sectionA/*.fastq

**6. Saving Your Work.** Any changes you make inside the Codespace are temporary unless committed to GitHub.
If needed, use Git to commit and push changes:
git add .
git commit -m "My analysis progress"
git push origin main

**7. Exiting and Resuming Your Codespace.** You can close the browser window when finished—your Codespace will save its state.
To resume, return to the repository’s Codespaces tab and reopen your session.

**8. Troubleshooting.** If you encounter errors, try restarting the Codespace.
If a tool is missing, reinstall it using:
sudo apt update && sudo apt install <package-name>Contact the instructor for further assistance.
