webpack = require('webpack')
path = require('path')
nodeExternals = require('webpack-node-externals')
StartServerPlugin = require('start-server-webpack-plugin')

definePlugin = new webpack.DefinePlugin
  WEBGL_RENDERER: true
  CANVAS_RENDERER: true

module.exports = {
  mode: 'development'
  devtool: 'inline-source-map'
  entry: [
    'webpack/hot/dev-server'
    'webpack-hot-middleware/client'
    "./client/Main.coffee"
    ],
  output:
    path: '/'
    filename: 'bundle.js'
    publicPath: 'http://localhost:3000/scripts/'
  target: 'web',
  module: {
    rules: [
      {
        test: /\.coffee$/,
        loader: "coffee-loader"
      }
      {
        test: /\.json$/,
        loader: 'json'
      }
      {
        test: [/\.vert$/, /\.frag$/]
        use: 'raw-loader' }
      {
        test: /\.(png|svg|jpg|gif|mp3|mp4|woff|woff2)$/
        use: [
          loader: 'url-loader'
          options:
            limit: 8000
            name: '/assets/[name].[ext]'
          ]
      }
    ]
  },
  resolve:
    extensions: [".web.coffee", ".web.js", ".coffee", ".js"]
    alias:{
      Game: path.resolve(__dirname, 'client/game/')
    }
  plugins: [
    definePlugin
    new webpack.HotModuleReplacementPlugin()
    ],

}
