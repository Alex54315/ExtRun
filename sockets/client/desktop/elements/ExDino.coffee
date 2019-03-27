class ExDino extends PIXI.Graphics

  constructor: (app) ->
    super()
    @app = app
    @beginFill(0xFF802D)
    @drawRect(0, 0, 100, 100)
    @x = 100
    @y = 500
    @endFill()
    @app.stage.addChild(@)
    @move = @app.moveY


    animate: =>
      console.log 'funciona'
      @y += @move


module.exports = ExDino
