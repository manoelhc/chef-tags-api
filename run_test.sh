#!/bin/bash
echo "################################################"
python3 ./chef-tag-api.py >/dev/null &
sleep 5
restafari -s localhost -P 9999 api_test/*
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
ps -ef | grep chef-tag-api | grep -v grep
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
PID=$(ps -ef | grep chef-tag-api | grep -v grep | awk '{print $2}')
[[ -n ${PID} ]] && kill ${PID}
echo "################################################"
