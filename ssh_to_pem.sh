#!/bin/bash
openssl rsa -in "./ssh/id_rsa" -outform pem > "./ssh/private.pem"
chmod 600 "./ssh/private.pem"
ssh-keygen -f "./ssh/id_rsa.pub" -m 'PEM' -e > "./ssh/public.pem"
chmod 600 "./ssh/public.pem"