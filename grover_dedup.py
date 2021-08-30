#!/usr/bin/env python

import yaml 
import sys
import os

triage_items = {}

file_path =  os.path.join(os.path.abspath(os.path.dirname(sys.argv[0]))) + f"\\tmp\{sys.argv[1]}\sfdc_metadata\cred_scan_triage\\triage.yaml"

with open(file_path, 'r') as in_stream:
    try:
        triage_items = yaml.safe_load(in_stream)
        dictionary_items = {}
        for item in triage_items['production_secret']:
            dictionary_items[item["id"]] = item

        result = []
        for key in dictionary_items.keys():
            entry = dictionary_items[key]
            entry['justification'] = "Mock secret used to run tests locally"
            result.append(entry)

        triage_items['production_secret'] = []
        triage_items['mock_secret'] = result
    except yaml.YAMLError as exc:
        print(exc)

with open(file_path, 'w') as out_stream:
    try:
        yaml.safe_dump(triage_items, out_stream)
    except yaml.YAMLError as exc:
        print(exc)