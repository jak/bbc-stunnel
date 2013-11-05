#!/bin/bash
echo "Home: $HOME"
echo "User: $USER"
echo ""
echo "Hint: You can drag the files into Terminal to provide the filename."
echo "Whats the full path to your ca.pem? (/Users/you/Documents/Certificates/ca.pem)"
read CA_PATH
if [[ -z "$CA_PATH" ]]; then
  CA_PATH="$HOME/Documents/Certificates/ca.pem"
fi

echo "Whats the full path to your password-less dev.bbc.co.uk.pem? (/Users/you/Documents/Certificates/dev.bbc.co.uk.pem)"
read CERT_PATH
if [[ -z "$CERT_PATH" ]]; then
  CERT_PATH="$HOME/Documents/Certificates/dev.bbc.co.uk.pem"
fi

echo "Stunnel configuration"
mkdir -p ~/.stunnel/bin
curl -L https://raw.github.com/jak/bbc-stunnel/master/stunnel.conf | sed -e "s|USERNAME|$USER|g" -e "s|CA_PATH|$CA_PATH|g" -e "s|CERT_PATH|$CERT_PATH|g" > ~/.stunnel/stunnel.conf

echo "LaunchD configuration"
mkdir -p ~/Library/LaunchAgents
curl -L https://raw.github.com/jak/bbc-stunnel/master/org.stunnel.plist | sed -e "s|USERNAME|$USER|g" > ~/Library/LaunchAgents/org.stunnel.plist

echo "Copy stunnel binary"
curl -L https://raw.github.com/jak/bbc-stunnel/master/stunnel -o ~/.stunnel/bin/stunnel
chmod +x ~/.stunnel/bin/stunnel

echo "Starting up stunnel via launchd"
launchctl load ~/Library/LaunchAgents/org.stunnel.plist

echo "Now you can connect to IRC on-reith 127.0.0.1:6667"
echo "and connect off-reith on 127.0.0.1:6668"
