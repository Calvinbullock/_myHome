sudo apt purge nano -y
sudo apt purge libreoffice -y

# stop some background services (cups - printing services)
sudo systemctl stop cups.service cups-browsed.service
sudo systemctl disable cups.service cups-browsed.service

# clean up at end just to be sure
sudo apt autoremove
