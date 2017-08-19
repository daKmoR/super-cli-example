Super CLI Example
=================

It shows how you could create your own cli using ycli.

Installation
------------

Use ONE of the following methods:
```
# install via npm
npm install --global super-cli-example

# install via git
git clone git@github.com:daKmoR/super-cli-example.git && cd super-cli-example && npm install

# if you have problems you can manually call ./install.sh
# if installed via npm it would be cd $(npm root -g)/super-cli-example && ./install.sh
```

Restart your Terminal/Console!!!

Usage
-----

Just open a terminal and type

```
$ super-cli

The Super CLI Example

Available Commands:
    super-cli bower
    super-cli config
    super-cli git-lab
    super-cli git
    super-cli help
    super-cli multiple
    super-cli release
    super-cli self-update
    super-cli util
    super-cli wct

Example:
    super-cli self-update
```

Create your own CLI from this
-----------------------------

Let's create a new cli and call it "Dust".

1) `git clone git@github.com:daKmoR/super-cli-example.git`
2) Replace `SUPER_CLI_DIR` with `DUST_DIR` everywhere
3) Rename `super-cli.sh` to `dust.sh`
4) Setup dust.sh with something like this
```
function dust() {
	ycliName="dust";
	ycliLongName="Dust CLI";
	ycliSubCli=1;

	ycliPluginsPaths=(${ycliFoundPluginsPaths[@]});
	# we want to also have all ycli script available inside dust
	ycliPluginsPaths+=("$YCLI_DIR"); # comment this line out if you only want YOUR commands visible
	ycliPluginsPaths+=("$DUST_DIR");

	# define the path to a second cli version
	if [[ ! " ${ycliCliPaths[@]} " =~ " $DUST_DIR/dust.sh " ]]; then
		ycliCliPaths+=("$DUST_DIR/dust.sh");
	fi

	ycli "$@"
	ycliSubCli=0;
}
```
5) Replace `super-cli` with `dust` in `install.sh` and `uninstall.sh`
6) Run `./install.sh`
7) Restart Console/Terminal or run `source ~/.bashrc`
8) Enjoy your own new CLI
