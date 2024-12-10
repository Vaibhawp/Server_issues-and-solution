#!/bin/bash
# Monitor the service with debugging

echo "Starting MonitorService.sh" | tee -a /tmp/MonitorService.log
# Add your service monitoring commands here
if [ $? -eq 0 ]; then
    echo "Service is running correctly." | tee -a /tmp/MonitorService.log
else
    echo "Service monitoring failed." | tee -a /tmp/MonitorService.log
    exit 1
fi
