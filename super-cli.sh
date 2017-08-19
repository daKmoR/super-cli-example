#!/bin/bash

function super-cli() {
	ycliName="super-cli";
	ycliLongName="The Super CLI Example";
	ycliSubCli=1;

	ycliPluginsPaths=(${ycliFoundPluginsPaths[@]});
	ycliPluginsPaths+=("$YCLI_DIR");
	ycliPluginsPaths+=("$SUPER_CLI_DIR");

	# define the path to a second cli version
	if [[ ! " ${ycliCliPaths[@]} " =~ " SUPER_CLI_DIR/super-cli.sh " ]]; then
		ycliCliPaths+=("$SUPER_CLI_DIR//super-cli.sh");
	fi

	ycli "$@"
	ycliSubCli=0;
}
