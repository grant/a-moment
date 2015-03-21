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

module.exports = patterns
