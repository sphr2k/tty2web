#!/usr/bin/env bash

if [ "$#" -gt 0 ]; then
  exec /usr/local/bin/tty2web "$@"
else
  # Default username & generate password
  DEFAULT_USERNAME=web2tty
  DEFAULT_PASSWORD=$(< /dev/urandom tr -dc A-Za-z0-9 | head -c 20)
  
  # Output the generated password
  echo "web2tty username: $DEFAULT_USERNAME"
  echo "web2tty password: $DEFAULT_PASSWORD"
  exec /usr/local/bin/tty2web --port 8080 -c $DEFAULT_USERNAME:$DEFAULT_PASSWORD -w /bin/bash
fi
