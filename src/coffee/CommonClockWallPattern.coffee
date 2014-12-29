HandRotationUtils = require './HandRotationUtils'

# Common clock wall patterns
CommonClockWallPattern =
  # Horizontal lines
  #
  # Example (2x2)
  # ──
  # ──
  horizontal: (width, height) ->
    fillPatternSingleRotation(width, height, HandRotationUtils.toHandRotation('-'))

  # Vertical lines
  #
  # Example (2x2)
  # ││
  # ││
  vertical: (width, height) ->
    fillPatternSingleRotation(width, height, HandRotationUtils.toHandRotation('|'))

  # Diagonal right lines
  #
  # Example (2x2)
  # \\
  # \\
  diagonalRight: (width, height) ->
    fillPatternSingleRotation(width, height, HandRotationUtils.toHandRotation('\\'))

  # Diagonal left lines
  #
  # Example (2x2)
  # //
  # //
  diagonalLeft: (width, height) ->
    fillPatternSingleRotation(width, height, HandRotationUtils.toHandRotation('/'))

  # X lines
  # Overflow repeat
  #
  # Example (2x2)
  # \/
  # /\
  x: (width, height) ->
    xDesign = HandRotationUtils.toHandRotation([
      '\\/'
      '/\\'
    ])
    fillPatternGridRotation(width, height, xDesign)

  # Square lines
  # Overflow repeat
  #
  # Example (2x2)
  # ┌┐
  # └┘
  square: (width, height) ->
    squareDesign = HandRotationUtils.toHandRotation([
      '┌┐'
      '└┘'
    ])
    fillPatternGridRotation(width, height, squareDesign)

  # Zigzag horizontal
  # Overflow repeat
  #
  # Example (2x2)
  # ┌┐
  # ┘└
  zigzagHorizontal: (width, height) ->
    zigzagHorizontalDesign = HandRotationUtils.toHandRotation([
      '┌┐'
      '┘└'
    ])
    fillPatternGridRotation(width, height, zigzagHorizontalDesign)

  # Zigzag vertical
  # Overflow repeat
  #
  # Example (2x2)
  # ┘┌
  # ┐└
  zigzagVertical: (width, height) ->
    zigzagVerticalDesign = HandRotationUtils.toHandRotation([
      '┘┌'
      '┐└'
    ])
    fillPatternGridRotation(width, height, zigzagVerticalDesign)

# Fills a pattern with the specified handRotation design
fillPatternSingleRotation = (width, height, handRotations) ->
  fillPatternGridRotation(width, height, [[handRotations]])

# Fills a pattern with overflow of the given grid rotation
fillPatternGridRotation = (width, height, gridRotations) ->
  pattern = []
  rotations =
    width: gridRotations[0].length
    height: gridRotations.length
  for y in [0...height]
    pattern[y] = []
    for x in [0...width]
      pattern[y][x] = gridRotations[y % rotations.height][x % rotations.width]

  pattern

module.exports = CommonClockWallPattern