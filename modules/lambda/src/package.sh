#!/bin/bash
cd "$(dirname "$0")"
zip -j databrew_trigger.zip databrew_trigger.py
zip -j dynamodb_to_s3_trigger.zip dynamodb_to_s3_trigger.py
