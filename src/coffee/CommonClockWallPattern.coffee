# Common clock wall patterns
CommonClockWallPattern =
  # Horizontal lines
  #
  # Example (2x2)
  # ──
  # ──
  horizontal: (width, height) ->
    fillPatternSingleRotation(width, height, [0, 180])

  # Vertical lines
  #
  # Example (2x2)
  # ││
  # ││
  vertical: (width, height) ->
    fillPatternSingleRotation(width, height, [90, 270])

  # Diagonal right lines
  #
  # Example (2x2)
  # \\
  # \\
  diagonalRight: (width, height) ->
    fillPatternSingleRotation(width, height, )

  # Diagonal left lines
  #
  # Example (2x2)
  # //
  # //
  diagonalLeft: (width, height) ->
    fillPatternSingleRotation(width, height, [135, 315])

  # X lines
  # Overflow repeat
  #
  # Example (2x2)
  # \/
  # /\
  x: (width, height) ->
    xDesign = [
      [[45, 225], [135, 315]]
      [[135, 315], [45, 225]]
    ]
    fillPatternGridRotation(width, height, xDesign)

  # Square lines
  # Overflow repeat
  #
  # Example (2x2)
  # ┌┐
  # └┘
  square: (width, height) ->
    squareDesign = [
      [[0, 90], [90, 180]]
      [[0, 270], [180, 270]]
    ]
    fillPatternGridRotation(width, height, squareDesign)

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