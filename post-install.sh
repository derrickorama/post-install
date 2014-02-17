#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#################
# Configuration #
#################

# Disable Amazon suggestions
# *TBD*

# Enable workspaces
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ hsize 2
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ vsize 2

# Change theme to Radiance
gsettings set org.gnome.desktop.interface gtk-theme "Radiance"
gsettings set org.gnome.desktop.wm.preferences theme "Radiance"
gsettings set org.gnome.desktop.interface icon-theme "ubuntu-mono-light"


########################
# Application installs #
########################

# Add repositories
sudo add-apt-repository -y ppa:mc3man/systray-white # systray-whitelist fix
sudo add-apt-repository -y ppa:tualatrix/ppa # Ubuntu Tweak
sudo add-apt-repository -y ppa:webupd8team/sublime-text-2 # Sublime Text 2
sudo add-apt-repository -y ppa:webupd8team/java # Oracle Java
# Dropbox
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
sudo add-apt-repository "deb http://linux.dropbox.com/ubuntu $(lsb_release -sc) main"
# Virtual Box
wget -q -O - http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian saucy non-free contrib" >> /etc/apt/sources.list.d/virtualbox.org.list'

# Set up Oracle Java Installer to auto-agree to the terms
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections

# Update packages
sudo apt-get update

# Install
# - Ubuntu Tweak
# - Sublime Text 2
# - Meld
# - VirtualBox
# - Synapse
# - Git
# - Oracle Java
# - Oracle Java (set default)
# - Iced Tea Plugin (Java for web browsers)
# - Node.js + NPM
# - Shutter
# - ReText
# - unrar
# - CompizConfig Settings Manager
# - curl
sudo apt-get install -y dropbox ubuntu-tweak sublime-text meld virtualbox-4.3 synapse git zsh oracle-java8-installer oracle-java7-set-default icedtea-7-plugin npm shutter retext unrar compizconfig-settings-manager curl

# Run upgrade (to install changes from the mc3man PPA
sudo apt-get upgrade -y

# Alias nodejs as node
sudo ln -s /usr/bin/nodejs /usr/bin/node

# Install global node modules
sudo npm install -g grunt-init jshint jasmine-node karma

# Install grunt-init-gruntfile
git clone https://github.com/gruntjs/grunt-init-gruntfile.git ~/.grunt-init/gruntfile

# Install the latest/stable version of Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get -fy install
rm google-chrome-stable_current_amd64.deb

############################
# After apps are installed #
############################

# Whitelist system tray icons
gsettings set com.canonical.Unity.Panel systray-whitelist "['all']"

# Set up launcher
gsettings set com.canonical.Unity.Launcher favorites "['application://nautilus.desktop', 'application://google-chrome.desktop', 'application://firefox.desktop', 'application://gnome-terminal.desktop', 'application://sublime-text-2.desktop', 'application://virtualbox.desktop', 'unity://running-apps', 'unity://expo-icon', 'unity://devices']"

# Copy .gitconfig
cp $DIR/assets/.gitconfig ~/.gitconfig

# Configure autostart
cp /usr/share/applications/dropbox.desktop ~/.config/autostart
cp /usr/share/applications/synapse.desktop ~/.config/autostart

# Change default shell to ZSH
sudo chsh -s /bin/zsh $USER

# Copy ZSH configuration
cp $DIR/assets/.zshrc ~/.zshrc

# Install oh-my-zsh
/bin/zsh -s 'curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh'

# Enable Java in Chrome
#  - Not sure that I need this
# sudo mkdir -p /opt/google/chrome/plugins
# sudo ln -s /usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/IcedTeaPlugin.so /opt/google/chrome/plugins

##
# Last Step (takes a while)
##

# Install IE VMs
(cd ~/Downloads && curl -O "https://az412801.vo.msecnd.net/vhd/VMBuild_20131127/VirtualBox/IE11_Win8.1/Linux/IE11.Win8.1.For.LinuxVirtualBox.part{1.sfx,2.rar,3.rar}" && unrar e IE11.Win8.1.For.LinuxVirtualBox.part1.sfx)
