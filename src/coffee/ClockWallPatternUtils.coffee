HandRotationUtils = require './HandRotationUtils'

# Utility functions for clock wall patterns
ClockWallPatternUtils =
  # Converts a string stream to clock patterns
  # Ex.
  # """
  # ◣◣◰-◳◢◢
  # ◣◴◣|◢◷◢
  # ◣|---|◢
  # ◣◵◤|◥◶◢
  # ◣◣◷-◴◢◢
  # ◣◣|-|◢◢
  # ◣◣└-┘◢◢
  # """
  # To the equivalent 3d array
  toClockWallPattern: (string) ->
    pattern = []
    rowIndex = 0
    pattern[rowIndex] = []
    for char in string
      if char == '\n'
        pattern[++rowIndex] = []
      else
        pattern[rowIndex].push HandRotationUtils.toHandRotation(char)

    pattern

  # Inserts a clock wall pattern at a specific place in another clock wall pattern
  # Modifies the background and returns it (redundantly)
  place: (background, placePattern, position) ->
    backgroundSize =
      width: background[0].length
      height: background.length
    placePatternSize =
      width: placePattern[0].length
      height: placePattern.length
    switch position
      when 'center'
        offset =
          x: (backgroundSize.width - placePatternSize.width) / 2
          y: (backgroundSize.height - placePatternSize.height) / 2

    # Copy the hand rotations
    for y in [0...placePatternSize.width]
      for x in [0...placePatternSize.width]
        background[offset.y + y][offset.x + x] = placePattern[y][x]

    background

  # Rotates a pattern by the specified number of degrees
  # The direction can be 'cw' or 'ccw'
  rotate: (pattern, degrees, direction = 'cw') ->
    if direction == 'ccw'
      degrees = -degrees % 360
    pattern.map (row) -> row.map (hands) -> hands.map (rot) -> (rot + degrees + 360) % 360

  # Inverses a wall pattern (rotates all hands by 90 degrees)
  inverse: (pattern) ->
    ClockWallPatternUtils.rotate pattern, 90


module.exports = ClockWallPatternUtils