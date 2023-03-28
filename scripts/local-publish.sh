#!/bin/bash

cd library
  rm -rf lib
  npm run build
  zipFile=`npm pack`

  mv $zipFile ../playground/imported-lib

  cd ../playground/imported-lib
    tar -xvzf $zipFile
    rm $zipFile
  cd -

  cd ../playground/imported-lib/package 
    npm link
  cd -

  LIB_NAME=$(cat package.json \
    | grep name \
    | head -1 \
    | awk -F: '{ print $2 }' \
    | sed 's/[",]//g')

  cd ../playground
    npm link $LIB_NAME
  cd -
cd -

cd playground
  npm start
cd -
