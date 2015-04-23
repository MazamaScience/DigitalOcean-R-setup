# DigitalOceanMakefile
#
# Targets for installation of software on Digital Ocean VMs.
#
# Software includes the bare minimum to test R compilation of the 'seismic'
# package developed for the IRIS DMC by Mazama Science.

debian7:
	# Update apt
	echo "" >> /etc/apt/sources.list
	echo "#ADDED LINE" >> /etc/apt/sources.list
	echo "http://cran.fhcrc.org/bin/linux/debian wheezy-cran3/" >> /etc/apt/sources.list
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 06F90DE5381BA480
	sudo apt-get update
	# Install system libraries need by R packages
	sudo apt-get --yes install libcairo2-dev
	sudo apt-get --yes --force-yes install r-cran-xml # unauthenticated package
	sudo apt-get --yes install libxml2-dev
	sudo apt-get --yes install libcurl4-gnutls-dev
	sudo apt-get --yes --force-yes install r-base r-base-dev # unauthenticated package
	# Install R packages
	/usr/bin/Rscript -e "install.packages(repos=c('http://cran.fhcrc.org/'), pkgs=c('stringr','signal','pracma','XML','RCurl'))"
	/usr/bin/Rscript -e "install.packages(repos=c('http://cran.fhcrc.org/'), pkgs=c('maps','mapdata','microbenchmark'))"
	# Get and compile R packages
	echo "Get package source code via svn or git."
	echo "R CMD build YOUR_FLAGS YOUR_PACKAGE"
	echo "R CMD check YOUR_FLAGS YOUR_PACKAGE.VERSION.tar.gz"
	echo "R CMD INSTALL YOUR_PACKAGE.VERSION.tar.gz"

