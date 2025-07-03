#!/bin/bash
# Run Splunk container locally

docker run -d \
  --name splunk \
  -p 8000:8000 \
  -p 8088:8088 \
  -p 9997:9997 \
  -e SPLUNK_START_ARGS=--accept-license \
  -e SPLUNK_PASSWORD=changeme123 \
  splunk/splunk:latest

echo "Splunk is starting on http://localhost:8000"

