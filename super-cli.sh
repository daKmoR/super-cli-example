#!/bin/bash

function super-cli() {
	ycliName="super-cli";
	ycliLongName="The Super CLI Example";
	ycliSubCli=1;
	ycliDir="$SUPER_CLI_DIR";

	ycliPluginsPaths=(${ycliFoundPluginsPaths[@]});
	ycliPluginsPaths+=("$SUPER_CLI_DIR");
	ycliPluginsPaths+=("$YCLI_DIR");

	# define the path to a second cli version
	if [[ ! " ${ycliCliPaths[@]} " =~ " SUPER_CLI_DIR/super-cli.sh " ]]; then
		ycliCliPaths+=("$SUPER_CLI_DIR//super-cli.sh");
	fi

	ycli "$@"
	ycliSubCli=0;
}
