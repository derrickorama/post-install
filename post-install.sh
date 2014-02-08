DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#################
# Configuration #
#################

# Disable Amazon suggestions
# *TBD*

# Enable workspaces
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ hsize 2
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ vsize 2

# Whitelist system tray icons
# - need to add this guys PPA
sudo add-apt-repository -y ppa:mc3man/systray-white
sudo apt-get update
sudo apt-get upgrade
gsettings set com.canonical.Unity.Panel systray-whitelist "['all']"

# Change theme to Radiance
gsettings set org.gnome.desktop.interface gtk-theme "Radiance"
gsettings set org.gnome.desktop.wm.preferences theme "Radiance"
gsettings set org.gnome.desktop.interface icon-theme "ubuntu-mono-light"


########################
# Application installs #
########################

# Add repositories
sudo add-apt-repository -y ppa:tualatrix/ppa # Ubuntu Tweak
sudo add-apt-repository -y ppa:webupd8team/sublime-text-2 # Sublime Text 2
sudo add-apt-repository -y ppa:webupd8team/java # Oracle Java
# Dropbox
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
sudo add-apt-repository "deb http://linux.dropbox.com/ubuntu $(lsb_release -sc) main"
# Virtual Box
wget -q -O - http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian saucy non-free contrib" >> /etc/apt/sources.list.d/virtualbox.org.list'

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
sudo apt-get install dropbox ubuntu-tweak sublime-text meld nautilus-dropbox virtualbox-4.3 synapse git zsh oracle-java8-installer oracle-java7-set-default icedtea-7-plugin apt-file npm shutter retext unrar

# Install global node modules
sudo npm install -g grunt-init jshint jasmine-node karma

# Install grunt-init-gruntfile
git clone https://github.com/gruntjs/grunt-init-gruntfile.git ~/.grunt-init/gruntfile

# Install Compiz Config Manager
# sudo apt-get install compizconfig-settings-manager
# Install manually (apt-get didn't work)

# Install Chrome
# sudo apt-get install google-chrome-stable
# - Install manually (apt-get didn't work) https://www.google.com/chrome/


############################
# After apps are installed #
############################

# Set up launcher
gsettings set com.canonical.Unity.Launcher favorites "['application://nautilus.desktop', 'application://google-chrome.desktop', 'application://firefox.desktop', 'application://gnome-terminal.desktop', 'application://sublime-text-2.desktop', 'application://virtualbox.desktop', 'unity://running-apps', 'unity://expo-icon', 'unity://devices']"

# Copy .gitconfig
ln -s $DIR/assets/.gitconfig ~/.gitconfig

# Configure autostart
cp /usr/share/applications/dropbox.desktop ~/.config/autostart
cp /usr/share/applications/synapse.desktop ~/.config/autostart

# Change shell to ZSH
chsh -s /bin/zsh

# Install oh-my-zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# Enable Java in Chrome
#  - Not sure that I need this
# sudo mkdir -p /opt/google/chrome/plugins
# sudo ln -s /usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/IcedTeaPlugin.so /opt/google/chrome/plugins

##
# Last Step (takes a while)
##

# Install IE VMs
(cd ~/Downloads && curl -O "https://az412801.vo.msecnd.net/vhd/VMBuild_20131127/VirtualBox/IE11_Win8.1/Linux/IE11.Win8.1.For.LinuxVirtualBox.part{1.sfx,2.rar,3.rar}" && unrar e IE11.Win8.1.For.LinuxVirtualBox.part1.sfx)