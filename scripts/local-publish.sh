#!/bin/bash

LIB_NAME=$(cat library/package.json \
  | grep name \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",]//g')

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

  cd ../playground
    npm link $LIB_NAME
  cd -
cd ..

cd playground
  npm start
cd ..
