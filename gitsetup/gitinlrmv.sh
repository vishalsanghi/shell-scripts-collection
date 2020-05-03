#!/bin/bash
# Author: Vishal Dilip Sanghi
# Created On: 02 May 2020
# Last Updated On: 02 May 2020
# Git Install, Remove and First Setup
source config.sh

echo
echo "1. Install GIT"
echo "2. Remove GIT"
echo
read -p "Choose Option: " install_method

if [ "$install_method" == 1 ]
then
# Install the GIT with below command
	apt-get install git 
	echo
	echo "GIT Installation Completed"
# Check the GIT version installed with below command. This is optional
	echo "Below is the installed GIT Version"
	echo
	git --version 

# Configure GIT global configuration with below commands. 
	echo
	read -p "Enter GIT Username: " username
	#Setting value to be picked from configuration file.
	username=${username:-$cusername}
	echo
	read -p "Enter GIT Email: " email
	#Setting value to be picked from configuration file.
        email=${email:-$cemail}
	git config --global user.name "$username"
	git config --global user.email "$email"

# Check the GIT Configuration.
	echo
	echo "Below is the GIT Configuration"
	echo
	git config --list

# Enter the code / working directory to Sync
	echo
	read -p "Enter working directory full path: " wdpath
        #Setting value to be picked from configuration file.
        wdpath=${wdpath:-$cwdpath}
	cd $wdpath

# Remove Existing README.md file if exists
	file="README.md"
	if [ -f "$file" ]
	then
        echo "$file found."
		rm -r $file
		echo
		echo "$file sucessfully deleted"
	else
        echo "$file not found."
	fi

# Enter Text for README.md file
	echo
	readmetextin="\n"
	echo "Enter text for README.Md file: "
		until [ "a$readmetextin" = "a" ];do
		read readmetextin
		readmetextop=$readmetextop"\n"$readmetextin
		done
	echo -e $readmetextop
	#Setting value to be picked from configuration file.
        readmetextop=${readmetextop:-$creadmetextop}
	echo -e $readmetextop >> README.md
	
#Git Commit
	# Initialize GIT 
	git init
	echo
	echo "Initialized Git"
	# Add files to the GIT. "." represents all the files in current directory.
	git add README.md
	read -p "Enter Commit Comments (Leave Blank for Default comments): " ccomments
	ccomments=${ccomments:-cccomments}
	# Commit to GIT
	git commit -m "$ccomments"
	
	# Add to the online GIT repository URL where the data should be synced in GIT
	echo
	read -p "Enter Repository URL with .git: " repoURL
        #Setting value to be picked from configuration file.
        repourl=${repourl:-$crepourl}
	echo
	git remote add origin $repoURL
	
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

else

	# Purgingurging git with remove (Recommended if you want completely uninstall with configurations)
	sudo apt-get autoremove --purge git
	find . -type f | grep -i "\.git" | xargs rm
	echo
	echo "GIT and related configurations removed sucessfully"

fi
