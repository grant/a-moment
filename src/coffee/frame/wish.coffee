Frame = require './Frame'
FrameMoment = require './moment'
ClockWallPatternUtils = require '../ClockWallPatternUtils'
HandRotationUtils = require '../HandRotationUtils'

# A 7x7 concentric circles
class FrameWish extends Frame
  getPatterns: ->
    width = Frame.DEFAULT_WIDTH
    height = Frame.DEFAULT_HEIGHT

    middle =
      x: Math.floor(width / 2)
      y: Math.floor(height / 2)

    momentPattern = new FrameMoment().getPatterns()
    hands = ClockWallPatternUtils.inverse(momentPattern)

    # Set the middle clock to be up
    hands[middle.y][middle.x] = HandRotationUtils.toHandRotation('`')

    hands

module.exports = FrameWish
