# DigitalOcean-R-setup
Makefile set up Digital Ocean droplets with software to compile R packages.

----

The aim of DigitalOcean-R-setup is to make it easier to test compilation of R packages on a wide variety of Unix variants
before submitting the package to CRAN. A single Makefile has different targets for the different VMs offered by
[Digital Ocean](http://digitalocean.com). This Makefile is targeted to the needs of [Mazama Science] for testing of
client packages but can be forked and modified to include other system libraries and R packages.
