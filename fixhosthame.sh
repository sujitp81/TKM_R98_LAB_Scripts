#!/bin/bash
git pull || true
touch /home/labadmin/stuff.stuff
/usr/bin/python3 /usr/local/bin/TKM_R98_LAB_Scripts/FixHostName.py > /home/labadmin/fixhostname.txt

