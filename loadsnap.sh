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
. $basedir/template.conf

logfile=$reportdir'/'$nowstamp
mkdir -p -m 700 $reportdir
touch $logfile

case $os in
custom)
  freemem=$custommem
  bandwidth=$custombw
  dagstat=$customdstat
  apach=$customa2ctl
  mysqlsatt=$custommysqladmin
  sarcommand=$customsar
  ;;
*)
  echo -e "Wrong OS choice. \nPlease check $basedir/loadsnap.conf and select one of the choices there"
  exit 2
  ;;
esac

# HEADER START
  (
    $separator
    $header
    $separator
  )2>&1 |tee -a $logfile
# HEADER END

# MODULES START
  (. $moddir/memory.sh ) 2>&1>> $logfile
# (. $moddir/network.sh) 2>&1>> $logfile
  (. $moddir/cpu.sh) 2>&1>> $logfile
#  (. $moddir/disk.sh) 2>&1>> $logfile

# MODULES END
exit 0
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

exit $?