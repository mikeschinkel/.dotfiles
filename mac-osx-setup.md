#Mac OSX Setup

A document shows how to setup a new Mac for WordPress development.

Inspired by [Kevin Elliott's excellent Gist](https://gist.github.com/kevinelliott/e12aa642a8388baf2499).

##Installing 


###Homebrew
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew doctor
	
###Homebrew's Cask
	brew install caskroom/cask/brew-cask

###Git/wget/iTerm2
	brew install git wget iterm2

###Docker/VirtualBox/Vagrant/Puppet
	brew install docker
	brew cask install dockertoolbox
	brew cask install virtualbox
    brew cask install vagrant
    brew cask install vagrant-manager
	brew cask install puppet

###Docker/VirtualBox/Vagrant/Puppet
	brew install docker
	brew cask install dockertoolbox
	brew cask install virtualbox
	brew cask install virtualbox-extension-pack
    brew cask install vagrant
    brew cask install vagrant-manager
	brew cask install puppet

###Node/NPM/Grunt/Gulp/Bower
	brew install node
	brew install npm
	npm install grunt --global
	npm install lodash/lodash --global
	npm install gulp --global
	npm install bower --global


###dotfiles

	git clone git@github.com:mikeschinkel/dotfiles.git ~/dotfiles.git
	echo 'source ~/.dotfiles/.bash_profile' >> ~/.bash_profile

###PHP/autoconf/Pear/Pecl
	cd ~/.dotfiles
	brew install autoconf
	brew install homebrew/php/php55-xdebug
		
	sudo cat php-extra.ini >> /etc/php.ini


	# http://jason.pureconcepts.net/2012/10/install-pear-pecl-mac-os-x/
	chmod +x expect-pear.sh
	./expect-pear.sh
    

###OS X

        #Set a blazingly fast keyboard repeat rate
        defaults write NSGlobalDomain KeyRepeat -int 0.02
        
        #Set a shorter Delay until key repeat
        defaults write NSGlobalDomain InitialKeyRepeat -int 12
        
        #Add a context menu item for showing the Web Inspector in web views
        defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
        
        #Show the ~/Library folder
        chflags nohidden ~/Library
        
        #Store screenshots in subfolder on desktop
        mkdir ~/Desktop/Screenshots
        defaults write com.apple.screencapture location ~/Desktop/Screenshots
        
###More to Come
- Git?
- MySQL?
- Other?

See https://gist.github.com/kevinelliott/e12aa642a8388baf2499