# Ubuntu with Apache and Docker

Instructionss to set up Digital Ocean droplets with software to compile R packages.

These instructions build a minimalist VM from scratch with only a 'root' user 
and without using virtual hosts with apache.

## Initial Server Setup

[Initial Server Setup with Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-18-04)

1. Log in to [Digital Ocean](http://digitalocean.com) and create a new droplet:
  * Ubuntu 18.04 > Basic > Create Droplet"
2. Log on to your droplet with ssh. (Find the droplet IP address in the DO dashboard.)
  * `ssh root@<ip address>`
3. Install make, vim, git and subversion by hand:
  * `apt update; apt --yes install make vim git`
4. Set up the basic firewall
  * `ufw allow OpenSSH; ufw enable`
5. Get the Makefiles:
  * `git clone https://github.com/MazamaScience/DigitalOcean-R-setup.git`


## Setting up Apache

[How To Install the Apache Web Server on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-install-the-apache-web-server-on-ubuntu-18-04)

1. Run Apache installation
  * `make -f Makefiles/Makefile.ubuntu18.04x64_docker apache`
  
## Setting up Docker

[How To Install and Use Docker on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04)




4. Set up the server:
  * follow [Initial Server Setup](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-18-04)
  * log out as root and log on as 'mazama' with `ssh mazama@<ip address>`
5. Get the Makefiles and run make:
  * `git clone https://github.com/MazamaScience/DigitalOcean-R-setup.git`
  * `cd DigitalOcean-R-setup`
  * `make -f Makefile.*OS_TARGET* all`
6. Clone your R package source code _e.g._:
  * `cd ~`
  * `git clone https://github.com/MazamaScience/MazamaCoreUtils.git`
7. Compile with _e.g._:
  * `R CMD build --resave-data MazamaCoreUtils`
  * `R CMD check --as-cran MazamaCoreUtils_0.4.4.tar.gz`
8. At the DO console, power off when you are finished.
9. __*Create a snapshot and delete your droplet to stop recurring fees.*__

