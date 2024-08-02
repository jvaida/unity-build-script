# How the script works:
The script automates the process of synchronizing our se-team Unity project repository with the original asu-meteor repository. 
1) It updates the original project **(asu-meteor/steel-artt-unity-team)** with the latest files from the custom repository **(kgary/steel-artt-unity-team-se)** .
2) Sets up a new Git repository.
3) Compiles the Unity project using the Unity CLI. 

This ensures that the project remains up-to-date with the latest customizations and builds correctly.

# Prerequisites:
1) Make sure you have added unity.exe (The executable for the unity editor) on your System PATH.
2) To verify the same, enter `unity -version` on your terminal and make sure it spits out the version.

# Steps to run:
1) Give executable permission to the script:
`chmod +x ./unity-build.sh`

2) Run the script:
`./unity-build.sh`