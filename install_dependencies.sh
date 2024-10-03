#/bin/bash

RED=`tput setaf 1`
GREEN=`tput setaf 2`
RESET=`tput sgr0`

#!/bin/bash

# Default values
input_file=""
test_file=""

# Function to display the help menu
display_help() {
    echo "Usage: ./install_dependencies.sh [OPTIONS]"
    echo "Options:"
    echo "  -i, --input FILE    Specify input dependencies file for installation"
	echo "  -t, --input FILE    Specify input dependencies file for vaildation (check if dependencies are already installed)"
    echo "  -h, --help          Display this help menu"
    exit 0
}

if [ $# -eq 0 ]; then
    display_help
    exit 0
fi

# Parse command-line options
while [[ $# -gt 0 ]]; do
    case "$1" in
        -i|--input)
            input_file="$2"
            shift 2
            ;;
		-t|--input)
            test_file="$2"
            shift 2
            ;;
        -h|--help)
            display_help
            ;;
        *)
            echo "Unrecognized option: $1"
            display_help
            ;;
    esac
done

is_package_installed() {
    if dnf list installed "$1" &> /dev/null; then
        return 0  # Package is installed, return true
    else
        return 1  # Package is not installed, return false
    fi
}

validate_file_exists() {
	if [ ! -e "$1" ]; then
		echo "${RED} $1 does not exist. ${RESET}"
		exit 1
	fi
}

if [[ -n $test_file ]]; then
	validate_file_exists $test_file
	while read package; do
	if is_package_installed $package; then
		echo "${GREEN} $package is installed. ${RESET}"
	else
		echo "${RED} $package is not installed. ${RESET}"
	fi
	done < $test_file
fi

if [[ -n $input_file ]]; then
	validate_file_exists $input_file
	sudo dnf install epel-release
	while read package; do
		echo -e "${GREEN} $package package is installing.... ${RESET}"
		sudo dnf install -y $package
	done < $input_file
fi
