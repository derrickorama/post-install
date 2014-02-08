# Warning: not tested... yet.

Threw this post-install together based on the post-install I use for my workstation. I cut out a bit so I could share it, so I need to test this script from a fresh install.

# Configuration

* Enable workspaces (4x4)
* Enable all icons in system tray (systray-whitelist)
* Changes to Radiance theme

# Application Installs

* Dropbox
* Git
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

## Node modules

* grunt-init + grunt-init-gruntfile
* jshint
* jasmine-node
* karma

# Post-application setup

* Sets up icons in launcher
    * Nautilus
    * Chrome
    * Firefox
    * Terminal
    * Sublime Text 2
    * VirtualBox
    * Running apps (standard)
    * Expo Icon (standard)
    * Devices (standard)
* Copies .gitconfig file
    * aliases
        * df = difftool
        * all = !git add -A . && git commit
        * stat = status
    * user config
        * email = derrickorama@gmail.com
        * name = Derrick Gall
    * diff tool
        * external = meld
* Adds to startup
    * Dropbox
    * Synapse
* Changes shell to zsh
    * Installs oh-my-zsh
* Installs IE11 VM