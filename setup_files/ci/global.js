var chromedriver = require('chromedriver');

module.exports = {
    waitingTime: 4000,
    screenshots: {
        custom_screenshots_path: './tests/nightwatch/screenshots/'
    },

    "dev": {
        before : function(done) {
            chromedriver.start();
            done();
        },

        after : function(done) {
            chromedriver.stop();
            done();
        },
    },

};
