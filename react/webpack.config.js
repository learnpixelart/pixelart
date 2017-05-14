var path = require('path');

var BUILD_DIR  = path.resolve(__dirname, 'build');
var SOURCE_DIR = path.resolve(__dirname, 'src');

module.exports = {
  entry: SOURCE_DIR+'/index.js',
  output: {
    filename: 'index.bundle.js',
    path:     BUILD_DIR
  },
  module: {
    rules: [
       {
         test: /\.(js|jsx)$/,
         exclude: /node_modules/,
         use: [
          'babel-loader',
         ]
       }
    ]
  }
};
