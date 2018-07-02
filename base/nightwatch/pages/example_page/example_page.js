var examplePageCommands;

examplePageCommands = {
    command: function (content) {
        return this
            .clearValue('@content')
            .setValue('@content', content);
    },

};

module.exports = {
    url: function () {
        return this.api.launchUrl + '/suffix';
    },
    commands: [examplePageCommands],
    elements: {
        content: {
          selector: '#app_bundle_tweet_form_content'
        }
    }
};
