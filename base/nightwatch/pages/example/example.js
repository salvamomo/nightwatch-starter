var examplePageCommands;

examplePageCommands = {
    command: function (content) {
        return this
            .clearValue('@some_alias')
            .setValue('@some_alias', content);
    },
};

module.exports = {
    url: function () {
        return 'http://nightwatchjs.org/';
    },
    commands: [examplePageCommands],
    elements: {
        slogan: {
          selector: '#index-container > div.jumbotron > div > div > div.col-lg-7.col-md-7 > p'
        }
    }
};
