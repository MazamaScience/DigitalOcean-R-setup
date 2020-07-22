# DigitalOcean-R-setup

Makefiles to set up Digital Ocean droplets with software to compile R packages.

## Background

The aim of DigitalOcean-R-setup is to make it easier to test compilation of R 
packages on a wide variety of Unix variants before submitting the package to
CRAN. Different Makefiles exist for the different VMs offered by
[Digital Ocean](http://digitalocean.com) (DO). Each Makefile is targeted to the needs of
[Mazama Science](http://mazamascience.com) for the testing of packages we maintain.
Others may wish to fork and modify these Makefiles to include other system 
libraries and R packages appropriate for testing their own packages.

The entire process should take less than half an hour per OS and means that you 
can thoroughly test your R package on a wide variety of Linux OS before submitting 
to CRAN.

## Creating a DO account

Go to [Digital Ocean](http://digitalocean.com) (DO) to create an account.

## Authenticate 

The best way to authenticate is to generate a personal access token 
(https://cloud.digitalocean.com/settings/tokens/new) and save it in an 
environment variable called DO_PAT. If you don’t do this, you’ll be prompted to 
authenticate in your browser the first time you use analogsea.

Make sure you provide digitial ocean your public key at 
https://cloud.digitalocean.com/ssh_keys. Github has some good advice on creating 
a new public key if you don’t already have one: 
https://help.github.com/articles/generating-ssh-keys/.

_(copied verbatim from [analogsea](https://analogsea.icu/index.html))_

## analogsea

The [analogsea](https://analogsea.icu/index.html) R package has functions for
managing DO droplets from the R console. Thee instructions below don't use 
**analogsea** but it is important to be aware that this package exists.

## Building a new VM from scratch

1. Log in to [Digital Ocean](http://digitalocean.com) and create a new droplet:
  * Ubuntu 18.04 > Basic > Create Droplet"
2. Log on to your droplet with ssh. (Find the droplet IP address in the DO dashboard.)
  * `ssh root@<ip address>`
3. Install make, vim, git and subversion by hand:
  * Debian, Ubuntu: `apt update; apt --yes install make vim git subversion`
  * Fedora, CentOS: `yum --assumeyes install make vim git subversion`
4. Get the Makefiles and run make:
  * `git clone https://github.com/jonathancallahan/DigitalOcean-R-setup.git`
  * `cd DigitalOcean-R-setup`
  * `make -f Makefile.*OS_TARGET* all`
5. Clone your R package source code _e.g._:
  * `cd ~`
  * `git clone https://github.com/MazamaScience/MazamaCoreUtils.git`
6. Compile with _e.g._:
  * `R CMD build --resave-data MazamaCoreUtils`
  * `R CMD check --as-cran MazamaCoreUtils_0.4.4.tar.gz.`
7. At the DO console, power off when you are finished.
8. __*Create a snapshot and delete your droplet to stop recurring fees.*__

## Building a VM from a snapshot

In the DO dashboard click on "Images" to see previously saved snapshots.

Then choose "More > Restore Droplet" to revive the snapshot.

You may also wish to "Create Droplet" if you are going to add more software.

