loadsnap
========

A simple bash script to generate server load snapshot for later investigation

-------------------------------------
I want my clients to make a server status report before killing processes, restarting Apache and doing similar things.
It has to be simple. I want them just to type "loadsnap" and that's it.
Any contributions are welcome. If you don't want to fork it, feel free to email any changes or ideas to forwardalias at gmail dot com

Requirements, but works without them too
-------------------------------------
- [sysstat](http://sebastien.godard.pagesperso-orange.fr/)
- [bwm-ng](http://www.gropp.org/?id=projects&sub=bwm-ng)
- [dstat](http://dag.wieers.com/home-made/dstat/)

Usage
-------------------------------------
- configure OS section in loadsnap.conf
- loadstat.sh - by default reports are saved to $basedir/reports/$timestamp

Tips
-------------------------------------
- `chmod 755 -where-you-placed-this-script-` and `ln -s -where-you-placed-this-script- /usr/bin/loadsnap`
- command paths and network ports can be specified in loadsnap.conf
- select modules that you want to use in loadsnap.conf
- report headers can be modified in template.conf
- feel free to modify modules in "modules" directory
- make your own module and contribute the code !

Licence
-------------------------------------
If you use it, and feel like buying me a beer, feel free to do so. I like all beer :)
If you don't, then don't :D
If you would like me to make html or xml reports, or check why your server is slow, feel free to contact me at horzadome at gmail


[GitHub repo](https://github.com/horzadome/loadsnap/)