#!/bin/bash

# the lib name, extracted from package.json
LIB_NAME=$(cat library/package.json \
  | grep name \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",|\ ]//g'

cd playground
  # uninstall lib above content to the playground app, with the name $LIB_NAME
  npm unlink $LIB_NAME
cd -
