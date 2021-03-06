# Nightwatch Starter kit
A simple starter kit for Nightwatch.js, with multiple setup modes to choose from.

## Requirements

  * Node.js
  * Nightwatch.js (_npm install -g nightwatch_)
  * A valid package.json in your repository (_recommended_, but not mandatory). 

## Installation

Download the install.sh file into your project root, and execute it. You'll want
to execute this **outside** of any development containers you have, to have access
to your web browsers. 

**NOTE: No global dependencies will be installed** 

You can run the installer by copying and pasting this command in your terminal:

    wget https://raw.githubusercontent.com/salvamomo/nightwatch-starter/master/install.sh ; sudo chmod +x install.sh ; ./install.sh
    
The installation script will:

  1. Ask you for a desired installation mode.
  2. Clone this repo in your /tmp directory.
  3. Move the relevant installation files to your tests/nightwatch directory.
  4. Install nightwatch.js as a local npm dependency, if it's not globally available.
  5. Install other node dependencies if needed (base on the setup chosen).
  5. Run the example test included in the base files.
  6. Remove the installer file and the repo from /tmp.
    
After a succesful installation, you'll be able to run nightwatch tests. There is
an example test included in the default setup. The environment name created by
default is "dev" in most cases (except in the CI setup, where it is "ci"). 
So, after installation, simply run:

    nightwatch --env=dev tests/nightwatch/tests

  or if nightwatch is installed just locally:
  
    ./node_modules/.bin/nightwatch --env=dev tests/nightwatch/tests/

## Setup modes

#### 1.- Plain (Dependencies downloaded manually).

Use this if you want to download manually dependencies 
(selenium, chromedriver, etc). Recommended only for experienced
users. 

NOTE: Requires manual steps after installation, detailed as part of the 
installation process.

#### 2.- NPM-Selenium.

Use this if you need to run tests that execute in more than one browser. Very
convenient if you plan to make it a more customized setup over time.

#### 3.- NPM-Chromedriver.

Use this if you simply one a simple and quick setup to start
writing automated browser tests for your project.

#### 4.- Simple CI.
 
This will set up an optimized nightwatch.json file for a simple CI stack.
The file will be configured to use chromedriver, via npm, and in headless mode,
so that no x-buffer is needed in your remote server.

Use this if you've never set up remote servers for testing and want a simple
way to get started. 

NOTE: This won't perform a full CI setup in your servers. Installation of web 
browser (e.g: chrome) in the servers must be done manually by you.

This option assumes you have chrome browser installed in your server, npm
is available and you're able to run "npm install" commands without sudo access.
