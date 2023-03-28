#!/bin/bash

rm -rf lib
npm run build
zipFile=`npm pack`

mv $zipFile .playground/imported-lib
# mv $zipFile ..

cd .playground/imported-lib
# cd ..
  rm -rf package
  tar -xvzf $zipFile
  rm $zipFile
cd -
# cd ../package 
cd .playground/imported-lib/package 
   npm link
cd -

LIB_NAME=$(cat package.json \
  | grep name \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",]//g')

cd .playground
  npm unlink $LIB_NAME
  npm link $LIB_NAME
cd -
