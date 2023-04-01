#!/bin/bash

# stop this script if some error occours
set -e

if [[ $# -eq 0 ]]; then ACCESS="public"; else ACCESS=$1; fi

# the lib name, extracted from package.json
LIB_NAME=$(cat library/package.json \
  | grep name \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",|\ ]//g'
  )

# undo local publishing
npm run local-unpublish

# publish to npm procedures
cd library
  npm run build
  npm publish --access $ACCESS
cd -

echo
echo "##################################################"
echo "# Your library is pulished in NPM repo."
echo "# Now it is ready to be used ($ACCESS access)."
echo "#"
echo "# Install it in you React project:"
echo "#"
echo "#    npm install $LIB_NAME"
echo "#"
echo "# Then use it in your code:"
echo "#"
echo "#    import { useFetch } from '$LIB_NAME';"
echo "#"
echo "##################################################"
