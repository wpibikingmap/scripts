#!/bin/bash
cd /home/jbkuszmaul/backups
MONTH=$(date +%m)
ls | grep "[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}" | grep -v "[0-9]\{4\}-\($MONTH\|[0-9]\{1,2\}-01\)" | xargs rm -f
