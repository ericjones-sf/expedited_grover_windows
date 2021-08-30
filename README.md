# expedited_grover_windows

## Information
- This is a port of https://git.soma.salesforce.com/cfernandes/expedited_grover and modified for Windows 10

## Prerequisites
- Setup [Grover](https://git.soma.salesforce.com/Sesame/grover/releases) on your machine
- Install [Python](https://www.python.org/downloads/release/python-396/)
- Set a PATH locally to python & grover
- Windows > Search > [App Execution Alias](https://stackoverflow.com/questions/65348890/python-was-not-found-run-without-arguments-to-install-from-the-microsoft-store/65496777#65496777): Turn off both Python alias 
- via Powershell: `py -m pip install PyYaml` to install a python yaml library needed

## What is in this repo?
grover_uber - does the complete workflow and will call :
- grover_start - clones the repo, runs grover and moves triage.yaml to the /sfdc_metadata/cred_scan_triage folder
- grover_dedup - updates triage.yaml by moving all production_secret to the mock_secrets property
- grover_end - creates a PR to add triage.yaml

## Usage 

Parameters 
- 1 - ORG 
- 2 - REPO

Example `./grover_uber.sh ad-studio campaign-service`

