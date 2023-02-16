#!/bin/bash
echo "Enter Year :"
read year
echo "*****Checking Leap Year******"
if [ $((year%4)) == 0 ]
 then
    echo "$year is Leap year."
else
    echo "$year is not leap year."
fi

