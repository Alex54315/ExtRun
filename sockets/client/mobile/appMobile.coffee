PIXI = require 'pixi.js'
$ = require 'jquery'

class MobileApp extends PIXI.Application
  animation:true
  animationNodes:[]

  constructor: (config, socket) ->
    super(config)
    @socket = socket
    window.addEventListener 'devicemotion', @onDeviceMotion
    $('body').html @view

  onDeviceMotion: (evt) =>
    console.log evt.accelerationIncludingGravity
    obj = {
      x:evt.accelerationIncludingGravity.x
      y:evt.accelerationIncludingGravity.y
      z:evt.accelerationIncludingGravity.z
    }
    @socket.emit "send:accelerometer", JSON.stringify(obj, null, 2)

  addAnimationNodes:(child)=>
    @animationNodes.push child
    null

  animate:=>
    @ticker.add ()=>
      for n in @animationNodes
        n.animate?()
module.exports = MobileApp
