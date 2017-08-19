#!/bin/bash

if [ ! -f ~/.bashrc ]; then
	if [ ! -f ~/.profile ]; then
		echo "[ERROR] No ~/.profile found - is your bash correctly setup?";
		return 1;
	fi

	echo "[INFO] ~/.bashrc missing will be created and liked in ~/.profile";
	touch ~/.bashrc
	echo "
# if running bash
if [ -n \"$BASH_VERSION\" ]; then
		# include .bashrc if it exists
		if [ -f \"$HOME/.bashrc\" ]; then
				. \"$HOME/.bashrc\"
		fi
fi" >> ~/.profile
fi

installDir=$(pwd);
sourceString="\nexport SUPER_CLI_DIR=\"${installDir}\"\n[ -s \"\$SUPER_CLI_DIR/super-cli.sh\" ] && \\. \"\$SUPER_CLI_DIR/super-cli.sh\"  # This loads super-cli\n"
completionString="[ -s \"\$SUPER_CLI_DIR/bash_completion.sh\" ] && \\. \"\$SUPER_CLI_DIR/bash_completion.sh\"  # This loads super-cli bash_completion\n"

if ! command grep -cq '/super-cli.sh' ~/.bashrc; then
	command printf "${sourceString}" >> ~/.bashrc
	command printf "${completionString}" >> ~/.bashrc

	echo "[FINISHED] Setup super-cli in ~/.bashrc";
	echo "Please restart your terminal/command line [or execute \"source ~/.bashrc\"]";
else
	echo "[INFO] super-cli is already present in ~/.bashrc - no action taken";
fi

if [ -f ~/.zshrc ]; then
	if ! command grep -cq '/super-cli.sh' ~/.zshrc; then
			command printf "${sourceString}" >> ~/.zshrc
			command printf "${completionString}" >> ~/.zshrc

			echo "[FINISHED] Setup super-cli in ~/.zshrc";
			echo "Please restart your terminal/command line  [or execute \"source ~/.zshrc\"]";
		else
			echo "[INFO] super-cli is already present in ~/.zshrc - no action taken";
	fi
fi
