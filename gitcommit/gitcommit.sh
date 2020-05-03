#!/bin/bash
# Author: Vishal Dilip Sanghi
# Git Commit Automated
# References: https://stackoverflow.com/questions/29776439/username-and-password-in-command-for-git-push
source config.sh

#Git Commit
# Initialize GIT 
git init
echo
echo "Initialized Git"

# Add files to the GIT. "." represents all the files in current directory.
git add .
echo
echo "Add all files to Git"

# Commit to GIT
echo
read -p "Enter Commit Comments: " ccomments
git commit -m "$ccomments"

# Push the GIT code from local to master branch. This will only now add the README.md file. No other files will be synced at this stage
# git push -u origin master

# Push the GIT code from local to master branch. Below command is used to pass username and it will ask for password prompt.
# Use this format: git push -u https://YOUR_GIT_USERNAME@github.com/YOUR_GIT_USERNAME/yourGitFileName.git <yourbranchname>
# In this command only the origin is replaced by the URL.
git push -u $corigin master

# Push the GIT code from local to master branch. Below command is used to pass username and password.
# Use this format: git push -u https://username:password@myrepository.biz/file.git <yourbranchname>
# In this command only the origin is replaced by the URL.
# git push https://username:password@myrepository.biz/file.git master
