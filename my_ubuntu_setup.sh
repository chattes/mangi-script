#!/bin/bash
# Sourav's Development Machine Setup on Ubuntu
# Author : Sourav Chatterjee
#
# set software sources to server for united states
#
# For other software:
## VLC from software center
## virtual box from software center
## PDF Mod from software center
## shutter from software center
## kazam from software center
## install unity tweak tool from software center
## install rebar: pull from github (for building erlang applications)
## Learn from https://github.com/rafaelstz/simplesh

sudo apt-get update

# Installing build essentials
sudo apt-get install -y build-essential libssl-dev

# Install zsh

sudo apt-get install -y zsh 

# Vim, Curl, Python - Some random useful stuff
sudo apt-get install -y vim curl wget git software-properties-common
 
sudo apt-get install -y python-dev, python-pip
sudo apt-get install -y python3-pip
sudo apt-get install -y libkrb5-dev
sudo apt-get install -y git xclip xsel

# Vim-Plug

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim



# Setup oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Setup plugins for oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# Setup https://github.com/wting/autojump
sudo apt-get install -y autojump

# Setup tmux
sudo apt-get install -y tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Nodejs and NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


source ~/.profile
nvm install 12.3.1

node -v

#nodemon
sudo npm install -g nodemon trash-cli empty-trash-cli eslint pm2 forever yarn  react-native-cli

# # Installing JDK and JRE
# sudo apt-get install -y default-jre
# sudo apt-get install -y default-jdk
sudo apt-get install openjdk-8-jre

# Installing RUST and Cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# Gimp Image Editor sudo apt-get install -y gimp gimp-data gimp-plugin-registry gimp-data-extras # Archive Extractors sudo apt-get install -y unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller # FileZilla - a FTP client
sudo apt-get install -y filezilla

# TLP - saves battery when Ubuntu is installed on Laptops
sudo apt-get remove laptop-mode-tools
sudo add-apt-repository ppa:linrunner/tlp
sudo apt-get update
sudo apt-get install -y tlp tlp-rdw 
# Thinkpad Only
sudo apt install acpi-call-dkms tp-smapi-dkms
sudo tlp start
sudo tlp-stat

# Powertop
sudo apt install -y powertop

# Sticky Notes
sudo apt-get install -y xpad guake

# KVM acceleration and cpu checker
sudo apt-get install -y cpu-checker
sudo apt-get install -y qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils
sudo apt-get install -y virt-manager
sudo apt-get install -y lib32z1 lib32ncurses5 lib32bz2-1.0 lib32stdc++6

# RPM and alien - sometimes used to install software packages
sudo apt-get install -y rpm
sudo apt-get install -y alien dpkg-dev debhelper


# For Android Studio (Gradle Daemon) #touch ~/.gradle/gradle.properties && echo "org.gradle.daemon=true" >> ~/.gradle/gradle.properties Snap installation
sudo apt update
sudo apt install snapd
sudo snap install zoom-client
sudo snap install code --classic
sudo snap install spt
sudo snap install spotify --classic
sudo snap install skype --classic
sudo snap install vlc
sudo snap install slack --classic
sudo snap install chromium
sudo snap install --edge nvim --classic
sudo snap install ksuperkey

cp ./sourav_zshrc ~/.zshrc

mkdir -p ~/.config/nvim
touch ~/.config/nvim/init.vim
echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after" >> ~/.config/nvim/init.vim
echo "let &packpath = &runtimepath" >> ~/.config/nvim/init.vim
echo "source ~/.vimrc" >> ~/.config/nvim/init.vim

git config --global user.email "souravchatterjee81@gmail.com"
git config --global user.name "sourav"


# Setup Calibre

sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin

# Install Flameshot
sudo apt install flameshot


# Install Docker CE
sudo apt install docker.io 
# Install Docker-Compose

sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
docker-compose --version


# Install watchman

cd
git clone https://github.com/facebook/watchman.git
cd watchman/
git checkout v4.9.0
sudo apt-get install -y autoconf automake build-essential python-dev libssl-dev libtool
./autogen.sh
./configure --enable-lenient
make
sudo make install
cd


# All Done -- Reboot

sudo reboot
