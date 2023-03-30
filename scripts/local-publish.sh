#!/bin/bash

# the lib name, extracted from package.json
LIB_NAME=$(cat library/package.json \
  | grep name \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",]//g')

cd library
  # delete last created lib if any
  rm -rf lib
  # build the library
  npm run build
  # pack the library for deployment
  zipFile=`npm pack`

  # move the zipFile to the processing place
  mv $zipFile ../playground/imported-lib

  cd ../playground/imported-lib
    # delete last unziped content if any
    rm -rf package
    # unzip - will create and unzip to /playground/imported-lib/package dir  
    tar -xvzf $zipFile
    # delete zip file no longer necessary
    rm $zipFile
  cd -

  cd ../playground/imported-lib/package
    # crate a link point of reference to be linked 
    npm link
  cd -

  cd ../playground
    # install lib above content to the playground app, with the name $LIB_NAME
    npm link $LIB_NAME
  cd -
cd ..

cd playground
  # rock'n roll!
  npm start
cd ..
