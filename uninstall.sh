#!/bin/bash

if [ ! -f ~/.bashrc ]; then
	echo "[INFO] ~/.bashrc missing are you sure super-cli is installed";
	return 1;
fi

if command grep -cq 'SUPER_CLI_DIR' ~/.bashrc; then
	command sed -i "/SUPER_CLI_DIR/d" ~/.bashrc
	echo "[FINISHED] Remove Setup of ycli in ~/.bashrc"
	echo "Please restart your terminal/command line";
fi

if [ -f ~/.zshrc ]; then
	if command grep -cq 'SUPER_CLI_DIR' ~/.zshrc; then
		command sed -i "/SUPER_CLI_DIR/d" ~/.zshrc
		echo "[FINISHED] Remove Setup of ycli in ~/.zshrc"
		echo "Please restart your terminal/command line";
	fi
fi
