#!/bin/bash
source "functions.sh"
bash "ssh_create.sh"
bash "ssh_to_pem.sh"
bash "ssl_create.sh"