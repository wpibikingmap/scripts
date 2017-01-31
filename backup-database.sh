#!/bin/bash
mysqldump -u mapping -p$(cat /home/jbkuszmaul/MYSQL_PASSWORD) -r/home/jbkuszmaul/backups/$(date +%Y-%m-%d-%T).sql bikemap
