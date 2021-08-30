#!/bin/bash

#usage ./grover_uber.sh ad-studio campaign-service

org=$1
repo=$2
./grover_start.sh $org $repo
python grover_dedup.py $repo
./grover_end.sh $org $repo