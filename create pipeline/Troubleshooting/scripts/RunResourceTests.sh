#!/bin/bash
# Run resource tests with debugging

echo "Starting RunResourceTests.sh" | tee -a /tmp/RunResourceTests.log
# Add your resource test commands here
if [ $? -eq 0 ]; then
    echo "Resource tests completed successfully." | tee -a /tmp/RunResourceTests.log
else
    echo "Resource tests failed." | tee -a /tmp/RunResourceTests.log
    exit 1
fi
