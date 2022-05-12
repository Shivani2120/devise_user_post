const {environment} = require('@rails/webpacker');
    const webpack = require('webpack');

    environment.plugins.prepend('Provide',
        new webpack.ProvidePlugin({
            $: 'jquery/src/jquery',
            jquery: 'jquery/src/jquery',
            jQuery: 'jquery/src/jquery', 'window.jQuery': 'jquery/src/jquery',
            moment: 'moment'
        })
    );

    module.exports = environment;