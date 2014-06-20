#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
GREEN="\e[0;32m"
GREENEND="\e[0m"

#################
# Configuration #
#################

# Prompt user to authenticate with sudo
echo "* This script requires sudo *"
sudo -v

# Enable workspaces
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ hsize 2
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ vsize 2
echo -e "${GREEN}* Workspaces enabled.${GREENEND}"

# Install Faenza icons (PPA not working)
mkdir tmp
mkdir -p ~/.icons
wget http://faenza-icon-theme.googlecode.com/files/faenza-icon-theme_1.3.zip --quiet -O tmp/faenza.zip
unzip -qq tmp/faenza.zip -d tmp/faenza
tar zxf tmp/faenza/Faenza.tar.gz -C ~/.icons
rm -rf tmp
gsettings set org.gnome.desktop.interface icon-theme 'Faenza'
echo -e "${GREEN}* Faenza icons installed and enabled.${GREENEND}"

# Enable Progress Fancy in Apt
echo 'Dpkg::Progress-Fancy "1";' | sudo tee /etc/apt/apt.conf.d/99progressbar > /dev/null
echo -e "${GREEN}* Progress Fancy for Apt enabled.${GREENEND}"

########################
# Application installs #
########################

# Add repositories
echo -e "${GREEN}* Repositories added:${GREENEND}"
sudo add-apt-repository -y ppa:tualatrix/ppa > /dev/null 2>&1 # Ubuntu Tweak
echo -e "${GREEN} * Ubuntu Tweak${GREENEND}"
sudo add-apt-repository -y ppa:webupd8team/sublime-text-2 > /dev/null 2>&1 # Sublime Text 2
echo -e "${GREEN} * Sublime Text 2${GREENEND}"
sudo add-apt-repository -y ppa:webupd8team/java > /dev/null 2>&1 # Oracle Java
echo -e "${GREEN} * Oracle Java${GREENEND}"
sudo add-apt-repository -y ppa:noobslab/themes > /dev/null 2>&1 # Flatts theme
echo -e "${GREEN} * Flatts Theme${GREENEND}"
# Dropbox
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E > /dev/null 2>&1
sudo sh -c 'echo "deb http://linux.dropbox.com/ubuntu/ trusty main" >> /etc/apt/sources.list.d/dropbox.list'

# Set up Oracle Java Installer to auto-agree to the terms
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections

# Update packages
sudo apt-get update > /dev/null

# Install
# - Ubuntu Tweak
# - Sublime Text 2
# - Meld
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
# - Flatts theme
# - Flash (plugin)
sudo apt-get install -y dropbox > /dev/null
echo -e "${GREEN}* Applications installed:${GREENEND}"
echo -e "${GREEN} * Dropbox${GREENEND}"
sudo apt-get install -y ubuntu-tweak > /dev/null
echo -e "${GREEN} * Ubuntu Tweak${GREENEND}"
sudo apt-get install -y sublime-text > /dev/null 2>&1
echo -e "${GREEN} * Sublime Text 2${GREENEND}"
sudo apt-get install -y meld > /dev/null
echo -e "${GREEN} * Meld${GREENEND}"
sudo apt-get install -y git > /dev/null
echo -e "${GREEN} * Git${GREENEND}"
sudo apt-get install -y zsh > /dev/null 2>&1
echo -e "${GREEN} * ZSH${GREENEND}"
sudo apt-get install -y oracle-java8-installer > /dev/null 2>&1
sudo apt-get install -y oracle-java8-set-default > /dev/null 2>&1
sudo apt-get install -y icedtea-7-plugin > /dev/null 2>&1
echo -e "${GREEN} * Oracle Java${GREENEND}"
sudo apt-get install -y npm > /dev/null 2>&1
echo -e "${GREEN} * NPM${GREENEND}"
sudo apt-get install -y shutter > /dev/null 2>&1
echo -e "${GREEN} * Shutter${GREENEND}"
sudo apt-get install -y retext > /dev/null
echo -e "${GREEN} * ReText${GREENEND}"
sudo apt-get install -y unrar > /dev/null
echo -e "${GREEN} * Unrar${GREENEND}"
sudo apt-get install -y compizconfig-settings-manager > /dev/null
echo -e "${GREEN} * CompizConfig Settings Manager${GREENEND}"
sudo apt-get install -y curl > /dev/null
echo -e "${GREEN} * Curl${GREENEND}"
sudo apt-get install -y flatts-theme > /dev/null
echo -e "${GREEN} * Flatts theme${GREENEND}"
sudo apt-get install -y flashplugin-installer > /dev/null
echo -e "${GREEN} * Flash plugin${GREENEND}"
sudo apt-get install -y pithos > /dev/null
echo -e "${GREEN} * Flash plugin${GREENEND}"
sudo apt-get install -y nautilus-open-terminal > /dev/null
echo -e "${GREEN} * Nautilus - Open Terminal Here${GREENEND}"

# Alias nodejs as node
sudo ln -s /usr/bin/nodejs /usr/bin/node
echo -e "${GREEN}* Node installed.${GREENEND}"

# Install global node modules
sudo npm install -g --silent grunt-init > /dev/null
echo -e "${GREEN}Node modules installed:${GREENEND}"
echo -e "${GREEN} * Grunt${GREENEND}"
sudo npm install -g  --silent jshint > /dev/null
echo -e "${GREEN} * JSHint${GREENEND}"
sudo npm install -g  --silent jasmine-node > /dev/null
echo -e "${GREEN} * Jasmine${GREENEND}"
sudo npm install -g  --silent karma > /dev/null
echo -e "${GREEN} * Karma${GREENEND}"

# Install grunt-init-gruntfile
if [ ! -f ~/.grunt-init/gruntfile ]
	then
		rm -rf ~/.grunt-init/gruntfile
fi
git clone -q https://github.com/gruntjs/grunt-init-gruntfile.git ~/.grunt-init/gruntfile
echo -e "${GREEN}* Installed grunt-init-gruntfile${GREENEND}"

# Install the latest/stable version of Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb --quiet
sudo dpkg -i google-chrome-stable_current_amd64.deb > /dev/null
rm google-chrome-stable_current_amd64.deb
echo -e "${GREEN}* Installed Google Chrome (stable)${GREENEND}"

############################
# After apps are installed #
############################

# Set theme to Flatts-Blue
gsettings set org.gnome.desktop.interface gtk-theme "Flatts-Blue"
gsettings set org.gnome.desktop.wm.preferences theme "Flatts-Blue"
echo -e "${GREEN}* Flatts theme enabled${GREENEND}"

# Set up launcher
gsettings set com.canonical.Unity.Launcher favorites "['application://nautilus.desktop', 'application://google-chrome.desktop', 'application://firefox.desktop', 'application://gnome-terminal.desktop', 'application://sublime-text-2.desktop', 'application://virtualbox.desktop', 'unity://running-apps', 'unity://expo-icon', 'unity://devices']"
echo -e "${GREEN}* Launcher icons applied${GREENEND}"

# Copy .gitconfig
cp $DIR/assets/.gitconfig ~/.gitconfig
echo -e "${GREEN}* .gitconfig added${GREENEND}"

# Configure autostart
cp /usr/share/applications/dropbox.desktop ~/.config/autostart
echo -e "${GREEN}* Dropbox set to autostart${GREENEND}"

# Copy ZSH configuration
cp $DIR/assets/.zshrc ~/.zshrc
echo -e "${GREEN}* Added ZSH config${GREENEND}"

# Install oh-my-zsh
curl --silent -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh > /dev/null 2>&1
echo -e "${GREEN}* Installed oh-my-zsh${GREENEND}"

# Change default shell to ZSH
sudo chsh -s /bin/zsh $USER
echo -e "${GREEN}* Changed default shell to ZSH${GREENEND}"