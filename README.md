# Before running

Make sure you run Software Updater to make sure you have installed the latest updates.

# Tested on fresh install of Ubuntu 13.10

I have confirmed that this works on a fresh install of Ubuntu 13.10 (my OS of choice).

**This assumes**

* You chose to download all updates during Ubuntu installation
* You chose to install 3rd party software during Ubuntu installation

# What this does

I have documented the gist of what this script does (it's not too complicated... yet). For a detailed explanation, look through the script yourself.

**After running this**

You'll have to finish the Dropbox setup manually and then restart the machine.

## Configuration

* Enable workspaces (4x4)
* Enable all icons in system tray (systray-whitelist)
* Changes to Radiance theme
* Changes default shell to zsh
    * Also installs [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
* **.gitconfig**
    * aliases
        * df = difftool
        * all = !git add -A . && git commit
        * stat = status
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

* [CompizConfig Settings Manager](https://apps.ubuntu.com/cat/applications/compizconfig-settings-manager/)
* [curl](http://curl.haxx.se/)
* [Dropbox](https://www.dropbox.com/)
* [Git](http://git-scm.com/)
* [Google Chrome](https://www.google.com/chrome/)
* [Meld](http://meldmerge.org/)
* [Node.js](http://nodejs.org/) + [NPM](https://www.npmjs.org/)
* [Oracle Java](www.oracle.com/us/technologies/java/)
* [ReText](http://sourceforge.net/projects/retext/)
* [Shutter](https://apps.ubuntu.com/cat/applications/shutter/)
* [Sublime Text 2](http://www.sublimetext.com/)
* [Synapse](https://apps.ubuntu.com/cat/applications/synapse/)
* [Ubuntu Tweak](http://ubuntu-tweak.com/)
* [unrar](http://www.rarlab.com/rar_add.htm)
* [Virtual Box](https://www.virtualbox.org/)

### Node modules

* [grunt-init](http://gruntjs.com/project-scaffolding) + [grunt-init-gruntfile](https://github.com/gruntjs/grunt-init-gruntfile)
* [jshint](http://www.jshint.com/docs/)
* [jasmine-node](https://github.com/mhevery/jasmine-node)
* [karma](http://karma-runner.github.io/)

## Post-application setup

* Installs IE11 VM (from [modern.ie](http://modern.ie/virtualization-tools))
