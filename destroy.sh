#!/bin/bash

# SET Values
DIRS=(echo */)

for dir in "${DIRS[@]:1}"; do
   cd $dir
   vagrant destroy -f
   cd -
done
