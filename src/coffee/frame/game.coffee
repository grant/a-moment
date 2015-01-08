Frame = require './Frame'
Pong = require './pong'
CommonClockWallPattern = require '../CommonClockWallPattern'
ClockWallPatternUtils = require '../ClockWallPatternUtils'

# A game of pong
class FrameGame extends Frame
  getPatterns: ->
    width = Frame.DEFAULT_WIDTH
    height = Frame.DEFAULT_HEIGHT

    # Background pattern for pong game
    background = CommonClockWallPattern.horizontal(width, height)

    hands = ClockWallPatternUtils.toClockWallPattern(background)

    hands

module.exports = FrameGame