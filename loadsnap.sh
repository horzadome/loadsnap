#!/bin/bash
#
# title		: logsnap.sh
# descritption	: A small script to make a server processes and resource snapshot so that it can be analyzed later.
# author	: Davor Grubisa <horzadome@gmail.com>
# url		: https://github.com/horzadome/loadsnap
# usage		: just run it, no arguments required
#
# version	: v.0.1 - 2012-09-19 Davor Grubisa : written the script
#			: v.0.2 - 2012-09-20 Davor Grubisa : externalized configuration
#				added templating support , added distro-specific configuration

# loadsnap.conf - modify paths and commands
# template.conf - modify header templates

nowstamp=$(date +%Z-%Y-%m-%d-%T)

# Check where the script actually resides
source="${BASH_SOURCE[0]}"
dir="$( dirname "$source" )"
while [ -h "$source" ]
do
  source="$(readlink "$source")"
  [[ $source != /* ]] && source="$dir/$source"
  dir="$( cd -P "$( dirname "$source"  )" && pwd )"
done
dir="$( cd -P "$( dirname "$source" )" && pwd )"
basedir=$dir

. $basedir/loadsnap.conf

logfile=$reportdir'/'$nowstamp
mkdir -p -m 700 $reportdir
touch $logfile

. $basedir/template.conf

case $os in
custom)
  freemem=$custommem
  bandwidth=$custombw
  dagstat=$customdstat
  apach=$customa2ctl
  mysqlstat=$custommysqladmin
  sarcommand=$customsar
  topproc=$customtop
  proclist=$customproc
  ;;
*)
  echo -e "Wrong OS choice. \nPlease check $basedir/loadsnap.conf and select one of the choices there"
  exit 2
  ;;
esac

# HEADER START
$separator 2>&1>> $logfile
$header 2>&1 |tee -a $logfile
$separator 2>&1>> $logfile
# HEADER END

# MODULES START
(. $moddir/memcpu.sh ) 2>&1>> $logfile
(. $moddir/network.sh) 2>&1>> $logfile
(. $moddir/disk.sh) 2>&1>> $logfile
(. $moddir/process.sh) 2>&1>> $logfile
(. $moddir/apache.sh) 2>&1>> $logfile
(. $moddir/mysql.sh) 2>&1>> $logfile
# MODULES END

# FOOTER START
$separator 2>&1>> $logfile
$footer 2>&1 |tee -a $logfile
$separator 2>&1>> $logfile
# FOOTER END

exit 0