#!/bin/bash
pwd
git -C /usr/local/bin/TKM_R98_LAB_Scripts pull || true
touch /home/labadmin/stuff.stuff
/usr/bin/python3 /usr/local/bin/TKM_R98_LAB_Scripts/FixHostName.py

