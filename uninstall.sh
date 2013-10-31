#!/bin/bash

echo "Removing launchd configuration"
if [ -e ~/Library/LaunchAgents/org.stunnel.plist ]; then
  launchctl unload ~/Library/LaunchAgents/org.stunnel.plist || true
  rm ~/Library/LaunchAgents/org.stunnel.plist
else
  echo "File doesn't exist"
fi

echo "Removing rest of files"
if [ -d ~/.stunnel ]; then
  rm -rf ~/.stunnel
else
  echo "Files don't exist"
fi
