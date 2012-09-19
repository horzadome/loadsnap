loadsnap
========
A simple script to generate server load snapshot for later investigation

== Requirements but works without them too
- sysstat
- bwm-ng

Just run it, no arguments required (or possible), and by default reports are saved to
/var/log/loadsnap/$timestamp

Tip: if you want your clients to make their own snapshots while server is not running to their liking, do

  `chmod 755 -where-you-placed-this-script-`

  `ln -s -where-you-placed-this-script- /usr/bin/loadsnap`


[GitHub repo](https://github.com/horzadome/loadsnap/)