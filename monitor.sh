#!/bin/bash
#
# Cron job to check server load and take load snapshot
# url		: https://github.com/horzadome/loadsnap
#

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

# cpunumber=`lscpu |awk 'NR==4 {print $2 0.9}'`
  case $loadcritical in
    ''|*[!1-9]*)
      critload=`lscpu |awk 'NR==4 {print $2 *0.9}'`
    ;;
    *)
      critload=$loadcritical
    ;;
esac

loadavg=`uptime | awk '{print $12}'`
snap=$(echo "$critload $loadavg" | awk '{ if ($1 < $2) print 1 }')
if [[ $snap == 1 ]];then ($basedir/loadsnap.sh) ;fi

exit