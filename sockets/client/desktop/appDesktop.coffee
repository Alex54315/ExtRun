$ = require 'jquery'
PIXI = require 'pixi.js'
ExDino = require './elements/ExDino'

class DesktopApp extends PIXI.Application
  animation:true
  animationNodes:[]

  moveY: null
  constructor: (config, socket) ->
    super(config)
    @buildApp()
    @socket = socket
    @socket.on 'send:accelerometer', @movimiento
    @drawDino()
  
  buildApp:=>
    $('body').html @view

  movimiento: (evt)->
    obj = JSON.parse(evt)
    @moveY = obj.y
    @moveX = obj.x
  
  drawDino: () =>
    @dino = new ExDino(@)

  addAnimationNodes:(child)=>
    @animationNodes.push child
    null

  animate:=>
    @ticker.add ()=>
      for n in @animationNodes
        n.animate?()

module.exports = DesktopApp
