Frame = require './Frame'
CommonClockWallPattern = require '../CommonClockWallPattern'

# A 7x7 star shaped pattern
class FrameMoment extends Frame
  getPatterns: ->
    width = Frame.DEFAULT_WIDTH
    height = Frame.DEFAULT_HEIGHT

    # Default background is horizontal
    pattern = CommonClockWallPattern.horizontal(width, height)

    # Make the middle 7x7 a star
    middle =
      x: Math.floor(width / 2)
      y: Math.floor(height / 2)

    # Make the very middle clock horizontal


module.exports = FrameMoment