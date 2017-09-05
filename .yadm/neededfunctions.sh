# Title: neededfunctions.sh
# Owner: Ashton S. Hellwig <ashtonscotthellwig@gmail.com>
# Purpose: Functions I need for my yadm bootstrap

# Install Zsh if not Found
function install_zsh_inf {
	if "$(command -v zsh)" ! "/usr/bin/zsh"; then
		echo "Please input your distribution"
		echo "Only Arch Linux and RHEL 7.3 with yum are supported"
		read DISTR
		case $DISTR in
			ARCH)
				echo "Installing Zsh with Pacman"
				sudo pacman -Syu --noconfirm
				sudo pacman -S zsh --noconfirm
				;;
			RHEL)
				echo "Installing Zsh with yum"
				sudo yum update; sudo yum -y upgrade all
				sudo yum -y install zsh
				;;
			*)
				echo "Unknown distrobution. Attempting with ARCH"
				sudo pacman -Syu --noconfirm
				sudo pacman -S zsh --noconfirm
		esac
		chsh -s $(which zsh); export ZDOTDIR="~/.zsh"
		echo "Zsh has been installed for ${DISTR}"
	elif command -v zsh = /usr/bin/zsh; then
		echo "Zsh is already installed."
		echo "If the config is incorrect, run \"install_prezto_yadm\"."
		echo "Exiting."
	fi
}
