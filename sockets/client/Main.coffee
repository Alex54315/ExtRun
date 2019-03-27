$ = require 'jquery'
io = require 'socket.io-client'
Mobile = require './mobile/indexMobile'
Desktop = require './desktop/indexDesktop'

require ('./assets/Standard/standard09_66-webfont.woff')
require ('./assets/Standard/standard09_66-webfont.woff2')
require ('./assets/title.png')

if window.location.pathname == '/mobile'
  new Mobile()
if window.location.pathname == '/desktop'
  new Desktop()
