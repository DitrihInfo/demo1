#!/bin/bash

clear
echo " Please imput commit:"
read -p "Please commit: " x
 /usr/bin/git add *
 /usr/bin/git commit "$x"
 /usr/bin/git push
echo "It`s OK"
