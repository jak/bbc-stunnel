BBC Stunnel
===========

Why?
----

Lots of people need access to IRC who don't want or need to install Xcode Developer Tools or Homebrew or anything else. 
This makes it simple.


Installation
------------
Ensure your proxies are set up if needed (export https_proxy...), and you need both the certificate authority PEM file
and your private key and certificate as a PEM file.

To get stunnel, run

    bash <(curl -s https://raw.github.com/jak/bbc-stunnel/master/install.sh)
    
Once you're up, you can using something like [Colloquy](http://colloquy.info/), [Adium](https://adium.im/) or 
[Linkinus](https://itunes.apple.com/gb/app/linkinus/id402390998?mt=12) to connect to `localhost` and port `6667` on 
reith, or `6668` off reith.


Removal
-------

To remove stunnel, run

    bash <(curl -s https://raw.github.com/jak/bbc-stunnel/master/uninstall.sh)

Or manually...

1. launchctl unload ~/Library/LaunchAgents/org.stunnel.plist
2. rm -rf ~/.stunnel
3. rm ~/Library/LaunchAgents/org.stunnel.plist


License
-------

stunnel is covered by the GPLv2, which is available in LICENSE.
stunnel's full source is [available here](https://www.stunnel.org/downloads.html).

The installation scripts and configurations are released into the public domain.
