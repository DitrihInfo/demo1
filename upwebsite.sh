#!/bin/bash

sudo apt-get update && sudo apt upgrade -y
sudo apt-get install apache2 -y
sudo chgrp -R ubuntu  /var/www
sudo chmod -R g+rw   /var/www
