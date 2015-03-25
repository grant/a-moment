ClockWallPatternUtils = require '../../ClockWallPatternUtils'

# Patterns for a pong game

paddleDesign = [
  """
  ┌┐
  ||
  └┘
  """
]
paddleGrowKeyframes = [
  [
    """
    ┌-┐
    | |
    | |
    | |
    └-┘
    """
  ]
,
  [
    """
    ┌---┐
    |   |
    |   |
    |   |
    |   |
    |   |
    └---┘
    """
  ]
]
ballDesign = [
  """
  ┌┐
  └┘
  """
]

patterns =
  paddle: ClockWallPatternUtils.toClockWallPattern(paddleDesign)
  ball: ClockWallPatternUtils.toClockWallPattern(ballDesign)

# A game of pong
class FramePong extends Frame
  getPatterns: ->
    width = Frame.DEFAULT_WIDTH
    height = Frame.DEFAULT_HEIGHT

    hands = CommonClockWallPattern.empty(width, height)

    # middle =
    #   x: Math.floor(width / 2)
    #   y: Math.floor(height / 2)

    # for y in [0...height]
    #   for x in [0...width]
    #     xDiff = x - middle.x
    #     yDiff = y - middle.y
    #     if !(x == middle.x and y == middle.y)
    #       angle = Math.atan2(yDiff, xDiff)
    #       hands[y][x] = HandRotationUtils.angleToHandRotation(angle)

    # # Make the very middle clock horizontal
    # hands[middle.y][middle.x] = HandRotationUtils.toHandRotation('-')

    hands

module.exports = FramePong
