#!/bin/bash
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout "./ssh/ssl_private.key" -out "./ssh/ssl_public.crt"
# file generated by this script should be as SSL keys