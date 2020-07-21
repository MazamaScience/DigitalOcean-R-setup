# DigitalOcean-R-setup

Makefiles to set up Digital Ocean droplets with software to compile R packages.

## Background

The aim of DigitalOcean-R-setup is to make it easier to test compilation of R packages on a wide variety of Unix variants
before submitting the package to CRAN. Different Makefiles exist for the different VMs offered by
[Digital Ocean](http://digitalocean.com). Each Makefile is targeted to the needs of
[Mazama Science](http://mazamascience.com) for the testing of packages we maintain.
Others may wish to fork and modify these Makefiles to include other system libraries and R packages appropriate for testing their own packages.

*NOTE:* Currently only `Makefile.debian7.0` is set up to compile R-devel

## Creating a DO account

Good instructions for creating an account and authenticating are documented in the **analogsea** package at https://analogsea.icu/#create-a-do-account

## Instructions

1. Spin up your droplet in RStudio using the [analogsea](https://analogsea.icu) package:
  * `> keys() # to find your PERSONAL_ACCESS_TOKEN`
  * `> d1 <- droplet_create(ssh_keys = "YOUR_PERSONAL_ACCESS_TOKEN")`
2. Log on to your droplet with ssh. (You will be the 'root' user.)
3. Install make, vim, git and subversion by hand:
  * Debian, Ubuntu: `apt-get update; apt-get --yes install make vim git subversion`
  * Fedora, CentOS: `yum --assumeyes install make vim git subversion`
4. Get the Makefiles and run make:
  * `git clone https://github.com/jonathancallahan/DigitalOcean-R-setup.git`
  * `cd DigitalOcean-R-setup`
  * `make -f Makefile.*OS_TARGET* all`
5. Use git to get your own code and test compile with:
  * `R-devel CMD build --resave-data *YOUR_PACKAGE*`
  * `R-devel CMD check --as-cran *YOUR_PACKAGE*`
6. `> d1 %>% droplet_power_off()` when you are finished.
7. __*Create a snapshot and delete your droplet to stop recurring fees.*__

The entire process should take less than half an hour per OS and means that you can thoroughly test your R package on a wide variety of Linux OS before submitting to CRAN.
