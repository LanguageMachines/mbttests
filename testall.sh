#!/bin/bash

\rm -f *.diff
\rm -f *.tmp

for file in mbttest mbtsimpleservertest mbtmultipleservertest mbtenriched
do ./testone.sh $file
done