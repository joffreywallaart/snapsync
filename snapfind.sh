#!/bin/bash

# paths=$(locate --database /data/snapsync/home/mlocate.db $1 | sort | sort -t'/' -k6)
paths=$(locate --database /data/snapsync/home/mlocate.db $1 | sort | xargs ls -i)

prev_inode=0
for path in $paths
do
    echo $path
    snapdate=$(echo $path|cut -f5 -d'/')
    inode=$(echo $path|cut -f1 -d' ')
    snappath=$(echo $path|cut -f6- -d'/')
    if [ $inode != $prev_inode ];
    then
        if [ $prev_inode != 0 ];
        then
            echo "    identical from " $first_snapdate to $prev_snapdate
        fi
        echo $snappath "first occurence"
        first_snapdate=$snapdate
        prev_inode=$inode
    else
        prev_snapdate=$snapdate
    fi
done