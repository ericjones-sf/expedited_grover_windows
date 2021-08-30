#!/bin/bash
org=$1
repo=$2

#create tmp folder if it doesn't exist
mkdir -p tmp

#clear existing folder
rm -rf tmp/$repo
cd tmp
git clone git@github.exacttarget.com:$org/$repo.git
cd $repo
git checkout -b grover_triage
cd ..
grover scanLocalGitRepo --generate-triage-file ./$repo/triage.yaml --json --repo-dir ./$repo > ./$repo/grover_output.json 
cd $repo
mkdir sfdc_metadata
cd sfdc_metadata
mkdir cred_scan_triage
cd ..
mv ./triage.yaml ./sfdc_metadata/cred_scan_triage