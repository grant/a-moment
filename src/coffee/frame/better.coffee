Frame = require './Frame'
ClockWallPatternUtils = require '../ClockWallPatternUtils'

# A stock market graph going up and to the right
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