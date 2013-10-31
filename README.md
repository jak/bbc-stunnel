BBC Stunnel
===========

Why?
----

Lots of people need access to IRC who don't want or need to install Xcode Developer Tools or Homebrew or anything else. This makes it simple.


Installation
------------
Ensure your proxies are set up if needed (export https_proxy...), and you need both the certificate authority PEM file
and your private key and certificate as a PEM file.

To get stunnel, run

    bash <(curl -s https://raw.github.com/jak/bbc-stunnel/master/install-stunnel.sh)


Removal
-------

To remove stunnel, run

    bash <(curl -s https://raw.github.com/jak/bbc-stunnel/master/uninstall.sh)

Or manually...

1. launchctl unload ~/Library/LaunchAgents/org.stunnel.plist
2. rm -rf ~/.stunnel
3. rm ~/Library/LaunchAgents/org.stunnel.plist
