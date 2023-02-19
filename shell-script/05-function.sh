#!/usr/bin/env bash

##Declare the function
sampel() {
  a=30
  echo sample function
  echo a from main program = $a
  b=20
}

## access the function
a=10
sample
echo b from function = $b
echo a from Main program = $a