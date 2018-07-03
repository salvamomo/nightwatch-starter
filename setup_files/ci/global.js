var chromedriver = require('chromedriver');

module.exports = {
    "ci": {
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
