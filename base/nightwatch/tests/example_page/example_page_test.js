/**
 *
 */
module.exports = {
    '@tags': [],
    '@disabled': false,
    'Test one' : ''+function (browser) {
        browser.init();

        browser
            .click('#navbarNavAltMarkup > div > a:nth-child(2)')
            .assert.containsText('body > div.main-content > h1', 'Test one')
            .end();
    },

    'Test two' : ''+function (browser) {
        browser.init();

        browser
          .click('#navbarNavAltMarkup > div > a:nth-child(3)')
          .assert.containsText('body > div.main-content > h1', 'Test Two')
          .end();
    }

};
