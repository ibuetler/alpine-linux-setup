#!/bin/bash

mydir=`pwd`

for i in `cat docker-images.txt`; do
	echo "=========================================="
	echo "START building $i"
	echo "=========================================="
	cd "$mydir/$i"
	git pull
        git add .
        git commit -a -m "update"
        git push

	./build-release.sh 3.2
	echo "=========================================="
        echo "END building $i"
        echo "=========================================="
done

