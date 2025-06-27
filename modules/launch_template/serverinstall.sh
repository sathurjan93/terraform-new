#!/bin/bash
sudo apt update
sudo apt install docker.io -y
sudo docker run -itd -p 80:80 nginx