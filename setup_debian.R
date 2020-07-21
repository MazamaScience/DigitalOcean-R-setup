# Use analaogsea to set up a debian 10.3 droplet

library(analogsea)

# Get Personal Access Tokens (requires manual login)
my_keys <- keys()

# Use the first (only?) key to spin up a new droplet
d <- droplet_create(ssh_keys = names(my_keys)[1], wait = TRUE)

ip_address <- d$networks$v4[[1]]$ip_address

# Suggestions from https://analogsea.icu/reference/debian.html
d %>% debian_add_swap()
d %>% debian_apt_get_update()

d %>% debian_install_r()
d %>% debian_install_rstudio()
