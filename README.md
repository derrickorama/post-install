# Before running

Make sure you run Software Updater to make sure you have installed the latest updates.

# Tested on fresh install of Ubuntu 13.10

I have confirmed that this works on a fresh install of Ubuntu 13.10 (my OS of choice).

## This assumes

* You chose to download all updates during Ubuntu installation
* You chose to install 3rd party software during Ubuntu installation

# After running this

You'll have to finish the Dropbox setup manually and then restart the machine.

# What this does

I have documented the gist of what this script does (it's not too complicated... yet). For a detailed explanation, look through the script yourself.

## Configuration

* Enable workspaces (4x4)
* Enable all icons in system tray (systray-whitelist)
* Changes to Radiance theme
* Changes default shell to zsh
    * Also installs oh-my-zsh
* **.gitconfig**
    * aliases
        * df = difftool
        * all = !git add -A . && git commit
        * stat = status
    * user config
        * email = derrickorama@gmail.com
        * name = Derrick Gall
    * diff tool
        * external = meld
* **Adds to startup**
    * Dropbox
    * Synapse
* **Sets up icons in launcher**
    * Nautilus
    * Chrome
    * Firefox
    * Terminal
    * Sublime Text 2
    * VirtualBox
    * Running apps (standard)
    * Expo Icon (standard)
    * Devices (standard)

## Application Installs

* CompizConfig Settings Manager
* curl
* Dropbox
* Git
* Google Chrome
* Meld
* Node.js + NPM
* Oracle Java
* ReText
* Shutter
* Sublime Text 2
* Synapse
* Ubuntu Tweak
* unrar
* Virtual Box

### Node modules

* grunt-init + grunt-init-gruntfile
* jshint
* jasmine-node
* karma

## Post-application setup

* Installs IE11 VM
