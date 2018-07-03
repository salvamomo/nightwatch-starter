/**
 *
 */
module.exports = {
    '@tags': [],
    '@disabled': false,
    'Test Nightwatchjs.org' : function (browser) {
        browser.init();

        var nightwatch_page = browser.page.example();

        nightwatch_page
            .navigate()
            .assert.containsText('@slogan', 'Browser automated testing done easy.');

        browser
            .pause(3000)
            .end();
    }
};
