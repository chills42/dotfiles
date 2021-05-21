#!/bin/sh

# Install Homebrew
which brew > /dev/null 2>&1
if [ $? -eq 1 ]; then
	#Cheat, if we don't have brew, install xcode command line utils too
	xcode-select --install

	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	brew update
fi
