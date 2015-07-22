# DigitalOcean-R-setup

Makefiles to set up Digital Ocean droplets with software to compile R packages.

## Background

The aim of DigitalOcean-R-setup is to make it easier to test compilation of R packages on a wide variety of Unix variants
before submitting the package to CRAN. Different Makefiles exist for the different VMs offered by
[Digital Ocean](http://digitalocean.com). Each Makefile is targeted to the needs of
[Mazama Science](http://mazamascience.com) for the testing of packages we maintain.
Others may wish to fork and modify these Makefiles to include other system libraries and R packages appropriate for testing their own packages.

*NOTE:* Currently only `Makefile.debian7.0` is set up to compile R-devel

## Instructions

1. Set up your droplet at digitalocean.com.
2. Log on to your droplet with ssh. (You will be the 'root' user.)
3. Install make, vim, git and subversion by hand
  * Debian, Ubuntu: `apt-get --yes install make vim git subversion`
  * Fedora, CentOS: `yum --assumeyes install make vim git subversion`
4. Get the Makefiles and run make
  * `git clone https://github.com/jonathancallahan/DigitalOcean-R-setup.git`
  * `cd DigitalOcean-R-setup`
  * `make -f Makefile.*OS_TARGET* all`
5. User svn or git to get your own code and test compile with
  * `R-devel CMD build *YOUR_PACKAGE*`
  * `R-devel CMD check --as-cran *YOUR_PACKAGE*`
6. `poweroff` when you are finished.
7. __*Create a snapshot and delete your droplet to stop recurring fees.*__

The entire process should take less than half an hour per OS and means that you can thoroughly test your R package on a wide variety of Linux OS before submitting to CRAN.
