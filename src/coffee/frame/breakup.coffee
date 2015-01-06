Frame = require './Frame'
CommonClockWallPattern = require '../CommonClockWallPattern'
ClockWallPatternUtils = require '../ClockWallPatternUtils'

# The X pattern with two squares moving apart
class FrameBreakup extends Frame
  getPatterns: ->
    width = Frame.DEFAULT_WIDTH
    height = Frame.DEFAULT_HEIGHT

    # Background pattern
    hands = CommonClockWallPattern.x(width, height)

    # Design must have odd dimensions to center properly
    keyframes = [
      """
      ┌┌┐
      |||
      └┘┘
      """
    ,
      """
      ┌-┌-┐
      | | |
      └-┘-┘
      """
    ,
      """
      ┌-┐ ┌-┐
      | | | |
      └-┘ └-┘
      """
    ,
      """
      ┌-┐   ┌-┐
      | |   | |
      └-┘   └-┘
      """
    ]
    pattern = ClockWallPatternUtils.toClockWallPattern(keyframes[3])

    hands = ClockWallPatternUtils.place(hands, pattern, 'center')

    hands

module.exports = FrameBreakup