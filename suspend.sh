#!/bin/bash

# SET Values
DIRS=(echo */)

for dir in "${DIRS[@]:1}"; do
   cd $dir
   # We could also use `suspend --all-global` 
   # but we might want to run a custom box outside the cluster
   vagrant suspend -f
   cd -
done
