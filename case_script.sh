#!/bin/bash

echo Please select your choice.
echo 1-Show current Directory
echo 2-List all directories
echo 3-show current shell

read choice

case $choice in
	1)pwd;;
	2)ls -ltr;;
	3)$0;;
	*)echo  invalid  Input

esac
