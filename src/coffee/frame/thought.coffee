Frame = require './Frame'
CommonClockWallPattern = require '../CommonClockWallPattern'
HandRotationUtils = require '../HandRotationUtils'
ClockWallPatternUtils = require '../ClockWallPatternUtils'

# A 7x7 lightbulb pattern
class Thought extends Frame
  getPatterns: ->
    width = Frame.DEFAULT_WIDTH
    height = Frame.DEFAULT_HEIGHT

    # Default background is horizontal
    hands = CommonClockWallPattern.horizontal(width, height)

    # Make the middle 7x7 a star
    starSize = 7
    starRadius = Math.floor(starSize / 2)
    middle =
      x: Math.floor(width / 2)
      y: Math.floor(height / 2)
    start =
      x: middle.x - starRadius
      y: middle.y - starRadius
    end =
      x: middle.x + starRadius
      y: middle.y + starRadius


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

module.exports = Thought