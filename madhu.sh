#!/bin/bash
GO=$(docker ps | grep time-tracker |wc -c)
echo "$GO"
if [ $GO -ne 0 ]
 then
   docker container rm --force time-tracker
   echo "I am inside the loop"
fi
