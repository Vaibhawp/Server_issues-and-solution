#!/bin/bash
# Unzip data bundle

echo "Starting UnzipDataBundle.sh" | tee -a /tmp/UnzipDataBundle.log
unzip /home/ubuntu/Repo/APP/release/pulse-app/data_bundle.zip -d /webapps/data 2>&1 | tee -a /tmp/UnzipDataBundle.log
if [ $? -eq 0 ]; then
    echo "Data bundle unzipped successfully." | tee -a /tmp/UnzipDataBundle.log
else
    echo "Failed to unzip data bundle." | tee -a /tmp/UnzipDataBundle.log
    exit 1
fi
