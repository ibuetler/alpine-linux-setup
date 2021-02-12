#!/bin/bash

for i in `cat docker-images.txt`; do
	echo "=========================================="
	echo "START building $i"
	echo "=========================================="
	cd "/opt/$i"
	git pull
        git add .
        git commit -a -m "update"
        git push

	./build-release.sh 3.2
	echo "=========================================="
        echo "END building $i"
        echo "=========================================="
done

