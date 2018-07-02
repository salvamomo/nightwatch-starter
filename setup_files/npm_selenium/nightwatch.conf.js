var selenium = require('selenium-server');
var chromedriver = require('chromedriver');
var geckodriver = require('geckodriver');

module.exports = (function(settings) {
    settings.selenium.server_path = selenium.path;
    settings.selenium.cli_args["webdriver.chrome.driver"] = chromedriver.path;
    settings.selenium.cli_args["webdriver.gecko.driver"] = geckodriver.path;

    return settings;
})(require('./nightwatch.json'));