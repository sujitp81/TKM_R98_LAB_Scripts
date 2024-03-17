#!/bin/bash
pwd
git -C /usr/local/bin/TKM_R98_LAB_Scripts pull || true
cp -fr /usr/local/bin/TKM_R98_LAB_Scripts/newrelic-infra.yml /etc/newrelic-infra.yml || true
#The license has been move to a separate file to keep it out of Github, so put it back.
cat /etc/newrelic.license.txt >> /etc/newrelic-infra.yml || true

/usr/bin/python3 /usr/local/bin/TKM_R98_LAB_Scripts/FixHostName.py

