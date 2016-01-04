#Mac OSX Setup

A document is an evolution showing how to setup a new Mac _(for WordPress development)_ and/or the README on an evolving repo of scripts to set up a new Mac.

Inspired by [Kevin Elliott's excellent Gist](https://gist.github.com/kevinelliott/e12aa642a8388baf2499).

Also kudos to:

- [Moncef Belyamani](https://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/)
- [Mathias Bynens](https://github.com/mathiasbynens/dotfiles/blob/master/.osx)

##Installing 

	

###Git & Configuration
	$ brew install git
    $ git config --global user.name "Your Name Here"
    $ git config --global user.email "your_name@domain.com"
    $ git config --global credential.helper osxkeychain
    $ cd ~/.ssh
	$ ssh-keygen -t rsa -C "your_email@domain.com"
	$ pbcopy < ~/.ssh/id_rsa.pub
	(browser) https://github.com/settings/ssh
	ssh -T git@github.com	
	
####.gitignore files
https://github.com/github/gitignore

###VirtualBox/Vagrant/Puppet
####Version 4.3.x

[Go here](https://github.com/thecodersguild/quick-start-installing-virtualbox-on-mac-os-x#version-43x).

####Version 5.0.x

	sudo brew cask install virtualbox
	brew cask install virtualbox-extension-pack
   
###Vagrant/Puppet

See [**_From the Ground Up:_ Learning Vagrant for WordPress on Mac OS X**](https://github.thecodersguild/learning-vagrant-for-wordpress)

Or:

    brew cask install vagrant
    sudo brew cask install vagrant-manager
    open -a Vagrant\ Manager.app
	brew cask install puppet
	
###Ansible/Docker
	brew install ansible
	brew install docker
	brew cask install dockertoolbox

###Vagrant/Puppet/Docker
	brew install docker
	brew cask install dockertoolbox
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

###PhpStorm
	sudo brew cask install phpstorm

###dotfiles

	git clone git@github.com:mikeschinkel/dotfiles.git ~/dotfiles.git
	

###PHP/autoconf/Pear/Pecl


	cd ~/.dotfiles
	brew install autoconf
	brew install homebrew/php/php55-xdebug
	sudo cat php-extra.ini >> /etc/php.ini
	# http://jason.pureconcepts.net/2012/10/install-pear-pecl-mac-os-x/
	chmod +x expect-pear.sh
	./expect-pear.sh


###OS X

OS X specific are in settings in [.osx.sh](.osx.sh).

###More to Come
- Git?
- MySQL?
- Other?

See https://gist.github.com/kevinelliott/e12aa642a8388baf2499
