#!/bin/bash -x

r=$((RANDOM % 2))
if [ $r -eq 1 ]
then
        echo "Head wins"
else
        echo "Tail wins"
fi

