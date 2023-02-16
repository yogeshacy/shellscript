#!/bin/bash
echo "Enter Number :"
read n
echo "*****Checking Odd or Even******"
if [ $((n%2)) == 0 ]
 then
    echo "$n is an even."
else
    echo "$n is an odd."
fi

