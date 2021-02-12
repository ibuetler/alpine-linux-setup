#!/bin/bash

for i in `cat docker-images.txt`; do
	echo "=========================================="
	echo "START GIT $i"
	echo "=========================================="
	cd "/opt/$i"
	git config pull.rebase false
	git pull
	git status
	git add .
	git commit -a -m "update"
	git push
done

