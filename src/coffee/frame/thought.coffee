Frame = require './Frame'
CommonClockWallPattern = require '../CommonClockWallPattern'
ClockWallPatternUtils = require '../ClockWallPatternUtils'

# A 7x7 lightbulb pattern
class FrameThought extends Frame
  getPatterns: ->
    width = Frame.DEFAULT_WIDTH
    height = Frame.DEFAULT_HEIGHT

    # Default background is horizontal
    hands = CommonClockWallPattern.horizontal(width, height)

    # Make the middle 7x7 a star
    design =
    """
    ◣◣◰-◳◢◢
    ◣◴◣|◢◷◢
    ◣|---|◢
    ◣◵◤|◥◶◢
    ◣◣◷-◴◢◢
    ◣◣|-|◢◢
    ◣◣└-┘◢◢
    """
    pattern = ClockWallPatternUtils.toClockWallPattern(design)

    hands = ClockWallPatternUtils.place(hands, pattern, 'center')

    hands

module.exports = FrameThought
