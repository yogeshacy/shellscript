#!/bin/bash

#for dir in `ls -l | grep ^d | awk '{print $NF}'`; do
#   echo "-------- $dir --------"
#	 cd $dir
	 git pull
	 git add -A
	 git commit -m "updating $dir"
	 git push
   git push --tags
	 cd -
#done

