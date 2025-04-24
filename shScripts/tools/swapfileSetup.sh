##
## Calvin Bullock
## Apr 24th 2025
## Create and activate a Swapfile for Linux
##

## create the swapfile
# create a 1MB swapfile at root (change the count=num for swapfile size)
sudo dd if=/dev/zero of=/swapfile bs=1M count=1024
#set the correct permissions for the swapfile
sudo chmod 600 /swapfile
# sets /swapfile to actually be a swapfile
sudo mkswap /swapfile

## Enable the swap file
# turn on swap (should get no output if works)
sudo swapon /swapfile
#double check swapfile is setup -- if desired
swapon --show

## Set up the system config
# this adds the conf line that you need to `/etc/fstab`
echo '/swapfile        none    swap    defaults        0 0' | sudo tee -a /etc/fstab

