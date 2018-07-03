#!/usr/bin/env bash

NIGHTWATCH_STARTER_TMP=/tmp/salvamomo/nightwatch-starter
NIGHTWATCH_DIR=tests/
BINARIES_DIR=tests/bin

# Grabbed from https://en.wikipedia.org/wiki/ANSI_escape_code#Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

remove_installer_and_starter_repo()
{
  echo "Removing Nightwatch-starter setup files."
  printf "${YELLOW}You might be asked for sudo password${NC}\n"

  sudo rm -r $NIGHTWATCH_STARTER_TMP
  if [ $? = 0 ]; then
  	printf "${GREEN}DONE:${NC} Successfully removed $NIGHTWATCH_STARTER_TMP directory.\n"
  fi

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

ensure_package_json()
{
  if [ ! -f ./package.json ]; then
    printf "${RED}ERROR:${NC} package.json file not found. Run \"npm init\" before executing this installer.\n"
    echo "You can run the installer again by typing \"./install.sh\""
    exit 1
  fi
}

move_boilerplate_files()
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

  move_boilerplate_files

  mkdir -p $NIGHTWATCH_DIR""bin
  touch $NIGHTWATCH_DIR""bin/.gitkeep

  cp $NIGHTWATCH_STARTER_TMP""/setup_files/plain/nightwatch.plain.json ./nightwatch.json

  printf "\n${GREEN}COMPLETED. PLAIN INSTALLATION REQUIRES MANUAL STEPS, READ BELOW:${NC}\n\n"

  echo "Download binaries for selenium and browser drivers into ${NIGHTWATCH_DIR}..."
  echo "Selenium can be downloaded from https://www.seleniumhq.org/download/"
  echo "Chromedriver can be downloaded from https://sites.google.com/a/chromium.org/chromedriver/"

  printf "${YELLOW}IMPORTANT:${NC} If you change the binaries directory, make sure to update the nightwatch.json file accordingly.\n"
}

install_npm_chromedriver()
{
  ensure_package_json

  echo "Installation Type: NPM-Chromedriver"
  clone_starter

  npm install chromedriver --save-dev

  move_boilerplate_files

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
