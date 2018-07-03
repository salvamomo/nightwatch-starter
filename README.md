# Nightwatch Starter kit
A simple starter kit for Nightwatch.js, with multiple setup approaches to choose from.

## Installation

Download the install.sh file into your project root, and execute it.

    wget https://raw.githubusercontent.com/salvamomo/nightwatch-starter/master/install.sh ; sudo chmod +x install.sh ; ./install.sh
    
After the installation

#### NPM-Chromedriver.
Use this if you simply one a simple and quick setup to start
writing automated browser tests for your project.

#### NPM-Selenium.

Use this if you need to run tests that execute in more than one browser.

#### Plain (Dependencies downloaded manually).

Use this if you want to download manually dependencies 
(selenium, chromedriver, etc). Recommended only for experienced
users. 

NOTE: Requires manual steps after installation.

#### Simple CI.
 
This will set up an optimized nightwatch.json file for a simple CI stack. 

NOTE: This won't perform a full CI setup in your servers. Installation of web 
browser in the servers must be done manually by you.

This option assumes you have chrome browser installed in your server, and npm
is available and you're able to run "npm install" commands without sudo access.
