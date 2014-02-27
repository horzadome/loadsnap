loadsnap
========

A simple bash script to generate server load snapshot for later investigation

Installation
-------------------------------------
- install git client - `yum install git` or `apt-get install git`
- `cd /opt`
- `git clone git://github.com/horzadome/loadsnap.git`
- `ln -s /opt/loadsnap/loadsnap.sh /usr/bin/loadsnap`
- `crontab -e`
- append this line to crontab and save `*/5 * * * * /opt/loadsnap/monitor.sh`

Usage
-------------------------------------
- configure OS section in /opt/loadsnap/loadsnap.conf , everything else can be left on default
- run command `loadsnap` - by default reports are saved to /opt/loadsnap/reports/$timestamp
- [Advanced configuration](https://github.com/horzadome/loadsnap/wiki#wiki-advanced)
- [Requirements](https://github.com/horzadome/loadsnap/wiki#wiki-requirements)
- [Tips](https://github.com/horzadome/loadsnap/wiki#wiki-tips)
- [Wiki](https://github.com/horzadome/loadsnap/wiki/)
- [GitHub repo](https://github.com/horzadome/loadsnap/)

Licence <a name="licence"> </a>
-------------------------------------
If you use it, and feel like buying me a beer, feel free to do so. I like all beer :)
If you don't, then don't :D
If you would like me to make html or xml reports, or check why your server is slow, feel free to contact me at horzadome at gmail
Be warned, this is under development and is not expected to yield the expected results :)