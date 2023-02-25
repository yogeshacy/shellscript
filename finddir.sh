#! /bin/bash

findFile(){
    echo "file name"
	read filename 
	PD=`pwd`
        cd $PD
	if [ -d $filename ]; then
	 echo "file exist..."
	else
	 mkdir $filename
         echo "file created..!"
        fi
}

findFile
