#! /bin/bash

findDirectory(){
    echo "directory name:"
	read dirname 
	PD=`pwd`
        cd $PD
	if [ -f $dirname ]; then
	 echo "directory exist..."
	else
	 touch $dirname
         echo "directory created..!"
        fi
}

findDirectory
