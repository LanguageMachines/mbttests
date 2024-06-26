#! /bin/sh

if test -e $1
then
  if test -e $2
  then
      diff -w -B --ignore-matching-lines=".?*, terminated at .?*" --ignore-matching-lines=".?*wrote PID.?*" --ignore-matching-lines=".?* intermediate file.*" $1 $2 | grep -v "Processing data" | grep -v "Algorithm" | grep -v "case base[:,]" | grep -v "20[12][0123456789]" |grep -v "\-\-\-" | grep -v "[0-9]\+[ac][0-9]\+" | grep -v "took [0-9]* seconds" | grep -v "Seconds taken:" | grep -i -v "Based on" | grep -v "cannot remove " |grep -v "Time used" |grep -v "Words/sec:" > md.tmp 2>& 1
      exit `wc -c < md.tmp`
  else
      echo
      echo "$2 not found"
      cat $1 > md.tmp
  fi
else
    echo
    echo "$1 not found"
fi
exit 1
