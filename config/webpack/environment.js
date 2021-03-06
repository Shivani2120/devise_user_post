const {environment} = require('@rails/webpacker');
const coffee =  require('./loaders/coffee')
const erb = require('./loaders/erb')
    const webpack = require('webpack');

    environment.plugins.prepend('Provide',
        new webpack.ProvidePlugin({
            $: 'jquery/src/jquery',
            jquery: 'jquery/src/jquery',
            jQuery: 'jquery/src/jquery', 'window.jQuery': 'jquery/src/jquery',
            moment: 'moment'
        })
    );

    environment.loaders.prepend('erb', erb)
environment.loaders.prepend('coffee', coffee)
module.exports = environment;