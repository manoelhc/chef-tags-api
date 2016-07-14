#!/bin/bash
python ./chef-tag-api.py >/dev/null &
restafari -s localhost -P 9999 api_test/*
PID=$(ps -ef | grep chef-tag-api | grep -v grep | awk '{print $2}')
[[ -n ${PID} ]] && kill ${PID}
