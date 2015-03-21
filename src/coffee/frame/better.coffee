Frame = require './Frame'
ClockWallPatternUtils = require '../ClockWallPatternUtils'

# A fist rising upward
class FrameBetter extends Frame
  getPatterns: ->
    width = Frame.DEFAULT_WIDTH
    height = Frame.DEFAULT_HEIGHT

    # Default background is horizontal
    hands = CommonClockWallPattern.horizontal(width, height)

    fistDesign =
    """
      ┌┌┐
     ┌|||
    ┌|┌--┐
    ||└-┐|
    |||| |
    |    |
    └┐  ┌┘
     |  |
    """

    # Animate the fist up

    hands

module.exports = FrameBetter
