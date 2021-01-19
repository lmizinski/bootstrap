#!/bin/bash
ssh-keygen -f "./ssh/id_rsa.pub" -m 'PEM' -e > "./ssh/public.pem"
chmod 600 "./ssh/public.pem"