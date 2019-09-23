#!/bin/bash
OK="\033[1;32m OK  \033[0m"
FAIL="\033[1;31m  FAILED  \033[0m"

if [ "$mbt_bin" == "" ];
then
  mbt_bin=/home/sloot/usr/local/bin
  if [ ! -d $mbt_bin ];
  then
     mbt_bin=/exp/sloot/usr/local/bin
     if [ ! -d $mbt_bin ];
     then
       echo "cannot find executables "
       exit
     fi
  fi
fi

export mbt_bin=$mbt_bin

for file in $1
do if test -x $file
   then
   	\rm -f $file.diff
	\rm -f $file.tmp
	\rm -f test*.out*
   	echo -n "testing  $file "
	./$file > $file.tmp 2>&1
	./mydiff.sh $file.tmp $file.ok
	if [ $? -ne 0 ];
	then echo -e $FAIL;
	cp md.tmp $file.diff;
	echo "differences logged in $file.diff";
	else echo -e $OK
	fi
   fi
done
