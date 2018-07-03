#!/usr/bin/env bash

NIGHTWATCH_STARTER_TMP=/tmp/salvamomo/nightwatch-starter
NIGHTWATCH_DIR=tests/
BINARIES_DIR=tests/bin

RED='\033[1;31m'
GREEN='\033[1;32m'
NC='\033[0m' # No Color

remove_installer_and_starter_repo()
{
  echo "Removing Nightwatch-starter repo from $NIGHTWATCH_STARTER_TMP."
  echo "You might be asked for sudo password"
  sudo rm -r $NIGHTWATCH_STARTER_TMP
  echo "Removing "`basename $0`

  rm -f basename $0
  if [ $? = 0 ]; then
  	printf "${GREEN}DONE:${NC} Successfully removed "`basename $0`"\n"
  fi
}

clone_starter()
{
  echo "Cloning Nightwatch-starter repo into $NIGHTWATCH_STARTER_TMP"
  git clone git@github.com:salvamomo/nightwatch-starter.git $NIGHTWATCH_STARTER_TMP
}

#ensure_nightwatch()
#{
#  # 127 = error response if nightwatch command is not found.
#  echo "TBC"
#}

ensure_package_json()
{
  if [ ! -f ./package.json ]; then
    printf "${RED}ERROR:${NC} package.json file not found. Run \"npm init\" before executing this installer.\n"
    echo "You can run the installer again by typing \"./install.sh\""
    exit 1
  fi
}

move_boilerplater_files()
{
  mkdir -p $NIGHTWATCH_DIR""nightwatch
  mv $NIGHTWATCH_STARTER_TMP""/base/nightwatch $NIGHTWATCH_DIR

  if [ $? = 0 ]; then
  	printf "${GREEN}DONE:${NC} Moved base stack structure into $NIGHTWATCH_DIR""nightwatch.\n"
  else
    printf "${RED}ERROR:${NC} Could not copy base stack files into $NIGHTWATCH_DIR""nightwatch.\n"
    remove_installer_and_starter_repo
    exit 1
  fi
}

install_plain()
{
  echo "Installation Type: Plain"
  clone_starter

  cp $NIGHTWATCH_STARTER_TMP""/setup_files/nightwatch.plain.json ./nightwatch.json


  echo "COMPLETED:"
  echo "Download binaries for selenium and browser drivers into tests/bin..."
  echo "To choose a different directory, make sure to update the nightwatch.json file accordingly."
}


install_npm_chromedriver()
{
  ensure_package_json

  echo "Installation Type: NPM-Chromedriver"
  clone_starter

  npm install chromedriver --save-dev

  move_boilerplater_files

  cp $NIGHTWATCH_STARTER_TMP""/setup_files/npm_chromedriver/nightwatch.npm_chromedriver.json ./nightwatch.json
  cp $NIGHTWATCH_STARTER_TMP""/setup_files/npm_chromedriver/global.js $NIGHTWATCH_DIR""nightwatch/data/global.js
}

install_npm_selenium()
{
  ensure_package_json

  echo "Installation Type: NPM-Selenium"
  clone_starter

  npm install selenium-server --save-dev
  npm install chromedriver --save-dev
  npm install geckodriver --save-dev

  cp $NIGHTWATCH_STARTER_TMP""/setup_files/nightwatch.selenium.json ./nightwatch.json
  cp $NIGHTWATCH_STARTER_TMP""/setup_files/nightwatch.conf.js ./nightwatch.conf.js
}

install_ci()
{
  ensure_package_json

  echo "Installation Type: CI"
  clone_starter

  npm install chromedriver --save-dev

  cp $NIGHTWATCH_STARTER_TMP""/setup_files/nightwatch.ci.json ./nightwatch.json
}

echo "Choose installation type:"
echo "    1) PLAIN              (No usage of npm)"
echo "    2) NPM-Selenium       (with Chromedriver and Geckodriver)"
echo "    3) NPM-Chromedriver"
echo "    4) Simple CI          (Chromedriver via npm)"

read choice
case "$choice" in
  1 ) install_plain;;
  2 ) install_npm_selenium;;
  3 ) install_npm_chromedriver;;
  4 ) install_ci;;
  * ) printf "${RED}Invalid choice${NC}\n"
      exit 1;;
esac

remove_installer_and_starter_repo
