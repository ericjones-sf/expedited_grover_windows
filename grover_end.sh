#!/bin/bash
org=$1
repo=$2
cd tmp 
cd $repo
echo 'Removing grover_output.json'
rm grover_output.json
echo 'Adding triage.yaml'
git add .
git commit -m"Adding triage.yaml file"
git push --set-upstream origin grover_triage