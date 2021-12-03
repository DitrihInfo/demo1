#!/bin/bash
#Setup Jenkins on ubuntu
sudo apt-get update && sudo apt upgrade
sudo apt-get install openjdk-8-jre -y
sudo apt-get install ca-certificates -y
sudo wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins -y
sudo service jenkins status
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
