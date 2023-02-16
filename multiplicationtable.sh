#!/bin/bash
echo "Enter Number :"
read n
echo "*****Multiplication table of $n******"
for((i=1; i<=20; i++))
do 
   echo "$n * $i = $((n*i))"
done

