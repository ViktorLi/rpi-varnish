#!/bin/bash

set -e

exec bash -c \
  "exec varnishd -F \
  -f $VCL_CONFIG \
  -a :6081 \
  -s malloc,$CACHE_SIZE \
  $VARNISHD_PARAMS"
