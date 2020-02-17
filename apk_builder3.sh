#!/bin/bash
echo "Please provide the path to directory, where you want to run this script ..?";
#location=$1
DIR="android/app/src/main/assets"

function apk_Builder(){
       
         echo " Working directory is $PWD "

         npx react-native bundle --dev false --platform android --entry-file index.js --bundle-output ./android/app/src/main/assets/index.android.bundle --assets-dest ./android/app/src/main/res

         echo "Android directory "
         cd android/
         echo " Working directory is $PWD "

         echo "Gradlew Process starts here "

         ./gradlew assembleDebug

         echo " ends here"

        # exit 0

}

if [ -d "$DIR" ]; then
  echo "Directory ${DIR} exists and proceeding further"
  apk_Builder
else

  echo "The ${DIR} not found. So creating directory ${DIR}"
  path=android/app/src/main

  cd $path/
  mkdir assets
  if [ -d "$DIR" ]; then
  echo "Directory ${DIR} now exists and proceeding further"
  fi

  echo "Directory ${DIR} has been created and proceeding further"
  apk_Builder
fi
