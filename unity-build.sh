#!/bin/bash

# 1. Pull the Custom Repository
echo "Pulling the se-team repository."
if [ ! -d "custom-repo" ]; then
  git clone https://github.com/kgary/steel-artt-unity-team-se.git custom-repo
  cd custom-repo
else
  cd custom-repo
  git pull origin main
fi

# 2. Pull the Original Repository
echo "Pulling the asu-meteor repository."
cd ..
if [ ! -d "original-repo" ]; then
  git clone https://github.com/asu-meteor/steel-artt-unity-team.git original-repo
  cd original-repo
else
  cd original-repo
  git add .
  git commit -m "Init commit"
  git pull origin main --allow-unrelated-histories
fi

# 3. Copy and Overwrite Files
echo "Copying and overwriting files from custom repo to original repo."
cp -r ../custom-repo/unity-template/Assets/JSON unity-template/Assets/
cp -r ../custom-repo/unity-template/Assets/Prefabs unity-template/Assets/
cp -r ../custom-repo/unity-template/Assets/Scenes unity-template/Assets/
cp -r ../custom-repo/unity-template/Assets/Scripts unity-template/Assets/
cp -r ../custom-repo/unity-template/Assets/WebGLTemplates unity-template/Assets/
cp ../custom-repo/unity-template/Assets/GiftEventHandler.cs unity-template/Assets/
cp ../custom-repo/unity-template/Assets/sample-json.json unity-template/Assets/
cp ../custom-repo/unity-template/.gitignore unity-template/
cp ../custom-repo/.gitignore .

# 4. Modify the Git Remote Repo
echo "Setting up new git repository for the original project."
cd ..
rm -rf original-repo/.git
cd original-repo
git init
git branch -M main
git remote add origin https://github.com/kgary/steel-artt-unity-team-se.git

# 5. Compile the project using Unity CLI
echo "Compiling the Unity project."
unity -batchmode -quit -projectPath "./unity-template" -logFile build.log

if [ $? -eq 0 ]; then
  echo "Unity project compiled successfully."
else
  echo "Failed to compile the Unity project. Check the original-repo/build.log for details."
fi
