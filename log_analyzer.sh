#!/bin/bash

echo "=================================================="
echo "                 LOG ANALYZER                     "
echo "=================================================="

echo ""

FAILED_LOGS=$(sudo journalctl -u ssh | grep "Failed password")

if [ -z "$FAILED_LOGS" ]; then
     echo "NO failed login attempts found."
      exit 0
fi


echo "Analyzing failed SSH login attempts..."
echo ""



echo "$FAILED_LOGS" | awk '{ for(i=1;i<NF;i++)  if( $i == "from" ) print $(i+1) }' | sort | uniq -c | sort -nr

echo ""
echo "Analysis complete!"


