#!/bin/bash
#
# title		: logsnap.sh
# descritption	: A small script to make a server processes and resource snapshot so that it can be analyzed later.
# author	: Davor Grubisa <horzadome@gmail.com>
# url		: https://github.com/horzadome/loadsnap
# usage		: just run it, no arguments required
#
# version	: v.0.1 - 2012-09-19 Davor Grubisa : written the script


# These parameters will be externalized to config file one day
# User configuration START
logdir='/var/log/loadsnap'


# User configuration ENDs here. Proceed, but beware of dragons

nowstamp=$(date +%Z-%Y-%m-%d-%T)
logfile=$logdir'/'$nowstamp
mkdir -p -m 700 $logdir
touch $logfile

(
  echo "==========================================="
  echo "Server load from" `hostname -f`
  echo "Taken on " $nowstamp
  echo "==========================================="
) 2>&1 |tee -a $logfile

(
  echo ""
  echo "==========================================="
  echo "           Memory usage (MB)"
  echo "==========================================="
  free -m
) 2>&1>> $logfile

(
  echo ""
  echo "==========================================="
  echo "              Network (approx numbers)"
  echo "==========================================="
  echo "Total conn: " `netstat -nap |wc -l`
  echo "HTTP conn : " `netstat -nap |grep :80 |wc -l`
  echo "MySQL conn: " `netstat -nap |grep :3306 |wc -l`
  echo "Bandwidth :"
  bwm-ng -o plain -c 1 -t 3000
) 2>&1>> $logfile

(
  echo ""
  echo "==========================================="
  echo "           CPU load ( last 10 intervals)"
  echo "==========================================="
  sar -q |tail -n 10
) 2>&1>> $logfile

(
  echo ""
  echo "==========================================="
  echo "           Disk IO (5s interval)"
  echo "==========================================="
  dstat --noupdate -a 5 1
) 2>&1>> $logfile


(
  echo ""
  echo "==========================================="
  echo "           Top output"
  echo "==========================================="
  top -b -n 1 -c
) 2>&1>> $logfile

(
  echo ""
  echo "==========================================="
  echo "           Process list"
  echo "==========================================="
  ps axuf
) 2>&1>> $logfile

(
  echo ""
  echo "==========================================="
  echo "           Apache processes"
  echo "==========================================="
  service httpd fullstatus
) 2>&1>> $logfile

(
  echo ""
  echo "==========================================="
  echo "           MySQL processes"
  echo "==========================================="
  mysqladmin processlist
) 2>&1>> $logfile

(
  echo ""
  echo "==========================================="
  echo "Snapshot done and saved as "
  echo $logfile
  echo "==========================================="
) 2>&1 |tee -a $logfile

exit 0