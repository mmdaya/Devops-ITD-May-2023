#!/bin/bash
sudo apt update -y
sudo apt install -y git jq nginx
echo 'This is remote-exec terraform example' > remote-exec.txt