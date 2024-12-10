#!/bin/bash
# Unzip resource bundle

echo "Starting UnzipResourceBundle.sh" | tee -a /tmp/UnzipResourceBundle.log
unzip /home/ubuntu/Repo/APP/release/pulse-app/resource_bundle.zip -d /webapps/resources 2>&1 | tee -a /tmp/UnzipResourceBundle.log
if [ $? -eq 0 ]; then
    echo "Resource bundle unzipped successfully." | tee -a /tmp/UnzipResourceBundle.log
else
    echo "Failed to unzip resource bundle." | tee -a /tmp/UnzipResourceBundle.log
    exit 1
fi
