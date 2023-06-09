#!/bin/bash

ufw allow 6443/tcp
curl -sfL https://get.k3s.io | sh -s - --node-external-ip=192.168.56.110 --token RandomTokenLOL ;
