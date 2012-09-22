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


Installation
-------------------------------------
- install git client - `yum install git` or `apt-get install git`
```cd /opt

git clone git://github.com/horzadome/loadsnap.git

ln -s /opt/loadsnap/loadsnap.sh /usr/bin/loadsnap

crontab -e ```
append this line to crontab and save `*/5 * * * * /opt/loadsnap/monitor.sh`


Usage
-------------------------------------
- configure OS section in /opt/loadsnap/loadsnap.conf , everything else can be left on default
- run command `loadsnap` - by default reports are saved to /opt/loadsnap/reports/$timestamp

Advanced configuration
-------------------------------------
- if you are using cPanel, select "cpanel" instead of the actual OS in loadsnap.conf
- if you compiled things from source or have some OS that's not in the list, set OS to "custom" in loadsnap.conf
- select modules that you want to use in loadsnap.conf
- if your services are on non-default ports, modify ports in loadsnap.conf
- you can change the cron job's overload treshold using "loadcritical" parameter. Please make sure to use integer value. Meaning a "whole number". Not decimal, and definitely not percentage. Or simply leave empty to have it automatically calculated to 90% of yout server's total CPU power.

Tips
-------------------------------------
- report headers can be modified in template.conf
- feel free to modify modules in "modules" directory
- make your own module and contribute the code !

Licence
-------------------------------------
If you use it, and feel like buying me a beer, feel free to do so. I like all beer :)
If you don't, then don't :D
If you would like me to make html or xml reports, or check why your server is slow, feel free to contact me at horzadome at gmail


[GitHub repo](https://github.com/horzadome/loadsnap/)