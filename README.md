# Tested on fresh install of Ubuntu 14.04

I have confirmed that this works on a fresh install of Ubuntu 14.04 (my OS of choice).

# How to run

1. Install Ubuntu 14.04
2. Navigate to this repo on Github and hit the "Download ZIP" button on the right
3. Extract the contents to a folder
4. Open your terminal and run the `post-install.sh` binary

# What this does

I have documented the gist of what this script does (it's not too complicated... yet). For a detailed explanation, look through the script yourself.

**After running this**

You'll have to finish the Dropbox setup manually and then restart the machine.

## Configuration

* Enable workspaces (4x4)
* Installs Faenza icons
* Enabled "Progress Fancy" in Apt
* Changes to [Flatts theme](http://www.noobslab.com/2014/03/new-flatts-theme-suite-offer-three.html)
* Changes default shell to zsh
    * Also installs [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
* **.gitconfig**
    * aliases
        * all = !git add -A . && git commit
        * ci = commit
        * df = difftool
        * stat = status
    * diff tool
        * external = meld
* **Adds to startup**
    * Dropbox
* **Sets up icons in launcher**
    * Nautilus
    * Chrome
    * Firefox
    * Terminal
    * Sublime Text 2
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
* [Oracle Java](http://www.oracle.com/us/technologies/java/)
* [ReText](http://sourceforge.net/projects/retext/)
* [Shutter](https://apps.ubuntu.com/cat/applications/shutter/)
* [Sublime Text 2](http://www.sublimetext.com/)
* [Ubuntu Tweak](http://ubuntu-tweak.com/)
* [unrar](http://www.rarlab.com/rar_add.htm)
* [Adobe Flash](http://get.adobe.com/flashplayer/)
* [Pithos](http://pithos.github.io/)
* [nautilus-open-terminal](https://launchpad.net/ubuntu/+source/nautilus-open-terminal)

### Node modules

* [grunt-init](http://gruntjs.com/project-scaffolding) + [grunt-init-gruntfile](https://github.com/gruntjs/grunt-init-gruntfile)
* [jshint](http://www.jshint.com/docs/)
* [jasmine-node](https://github.com/mhevery/jasmine-node)
* [karma](http://karma-runner.github.io/)