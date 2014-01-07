Frame = require './Frame'
CommonClockWallPattern = require '../CommonClockWallPattern'
ClockWallPatternUtils = require '../ClockWallPatternUtils'

# A game of pong
class FrameGame extends Frame
  getPatterns: ->
    width = Frame.DEFAULT_WIDTH
    height = Frame.DEFAULT_HEIGHT

    # Background pattern for pong g
    background = CommonClockWallPattern.horizontal(width, height)

    paddleDesign = [
      """
      ┌┐
      ||
      └┘
      """
    ]
    ballDesign = [
      """
      ┌┐
      └┘
      """
    ]
    hands = ClockWallPatternUtils.toClockWallPattern(background)

    hands

module.exports = FrameGame