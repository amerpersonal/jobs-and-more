const { environment } = require('@rails/webpacker');


// import { environment } from '@rails/webpacker'
//import { ProvidePlugin } from 'webpack'

const webpack = require('webpack');

const customConfig = require('./custom');


environment.plugins.append('Provide',
    new webpack.ProvidePlugin({
        $: 'jquery/src/jquery',//'jquery',
        jQuery: 'jquery/src/jquery', //'jquery',
        Popper: ['popper.js', 'default'],
        moment: 'moment/moment'
    }))

// export default environment

environment.config.merge(customConfig);

module.exports = environment;


