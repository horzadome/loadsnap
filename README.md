loadsnap
========
A simple script to generate server load snapshot for later investigation


Idea is simple - I want my clients to make a server status report before killing processes, restarting Apache and doing similar things.

It has to be simple. I want them just to type "loadsnap" and that's it.

Any contributions are welcome. If you don't want to fork it, feel free to email any changes or ideas to forwardalias at gmail dot com

**Requirements but works without them too:**
-  sysstat
-  bwm-ng

Just run it, no arguments required (or possible), and by default reports are saved to
/var/log/loadsnap/$timestamp

**Tips:**

- `chmod 755 -where-you-placed-this-script-` and `ln -s -where-you-placed-this-script- /usr/bin/loadsnap`


**Licence: Beerware**

If you use it, feel free to buy me a beer when you see me. If you feel like it. If you don't, then don't :D'


[GitHub repo](https://github.com/horzadome/loadsnap/)