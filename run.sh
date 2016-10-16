#!/bin/sh
set -e

# This file does lots of running around before generating a new AIDE database.

if [ -f /var/lib/aide/aide.conf ]
  then
  # override the existing AIDE configuration file if exists
  # in the database directory.
  echo "Found /var/lib/aide/aide.conf. Overriding the default configuration with this."
  ln -sf /var/lib/aide/aide.conf /etc/aide.conf
  chmod 600 /var/lib/aide/aide.conf
fi

if [ ! -f /var/lib/aide/aide.db.gz ]
  then
  echo "Generating a new AIDE database in /var/lib/aide/aide.db.gz..."
  exec /usr/sbin/aide --init && mv -vf /tmp/aide.db.new.gz /var/lib/aide/aide.db.gz && echo "Done generating AIDE database... exiting..."
fi
