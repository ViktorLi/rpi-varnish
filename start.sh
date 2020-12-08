#!/bin/bash

set -e

exec bash -c \
  "exec varnishd -F \
  -f $VCL_CONFIG \
  -a http=:6081,HTTP \
  -a proxy=:6082,PROXY \
  -s malloc,$CACHE_SIZE \
  $VARNISHD_PARAMS"
