# Ubuntu with Apache and Docker

Instructionss to set up Digital Ocean droplets with software to compile R packages.

These instructions build a minimalist VM from scratch with only a 'root' user 
and without using virtual hosts with apache.

## Initial Server Setup

[Initial Server Setup with Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-18-04)

We will be skipping the creation of a non-root user.

1. Log in to [Digital Ocean](http://digitalocean.com) and create a new droplet:
  * Ubuntu 18.04 > Basic > Create Droplet"
2. Log on to your droplet with ssh. (Find the droplet IP address in the DO dashboard.)
  * `ssh root@<ip address>`
3. Install make, vim and git by hand:
  * `apt update; apt --yes install make vim git`
4. Set up the basic firewall
  * `ufw allow OpenSSH; ufw enable`
5. Get the Makefiles:
  * `git clone https://github.com/MazamaScience/DigitalOcean-R-setup.git`
6. Set default editors, etc.
  * `cd DigitalOcean-R-setup`
  * `make -f Makefiles/Makefile.ubuntu18.04x64_docker setup`


## Setting up Apache and Server-Health Logs

[How To Install the Apache Web Server on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-install-the-apache-web-server-on-ubuntu-18-04)

All commands should be executed as root while in the `DigitalOcean-R-setup/` directory.

1. Run Apache installation
  * `make -f Makefiles/Makefile.ubuntu18.04x64_docker apache`
2. Add server logs
  * `make -f Makefiles/Makefile.ubuntu18.04x64_docker server_logs`
3. Add server-health crontab
  * `crontab crontabs_etc/crontab_server_health.txt`


## Setting up Docker

[How To Install and Use Docker on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04)


1. Install docker
  * `make -f Makefiles/Makefile.ubuntu18.04x64_docker docker`


## Setting up a Dockerized Service.

Congratulations! This DO server is now ready to have a dockerized service 
installed. Please see setup instructions in each service repository.

