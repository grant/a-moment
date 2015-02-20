CommonClockWallPattern = require './CommonClockWallPattern'
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
    maxArrLen = (prev, curr, index, arr) -> Math.max(arr[index].length, prev)
    placePatternSize =
      width: placePattern.reduce(maxArrLen, 0)
      height: placePattern.length

    # Calculate the position offset
    switch position
      when 'center'
        offset =
          x: (backgroundSize.width - placePatternSize.width) / 2
          y: (backgroundSize.height - placePatternSize.height) / 2

        # Assert that these values are okay (whole numbers)
        if offset.x != Math.round(offset.x) or offset.y != Math.round(offset.y)
          throw new Error 'Dimensions of placePattern must be odd (to center properly)'

    # Copy the hand rotations
    for y in [0...placePatternSize.height]
      patternRow = placePattern[y]
      for x in [0...patternRow.length]
        handRotation = placePattern[y][x]
        if handRotation
          background[offset.y + y][offset.x + x] = handRotation

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

  # Clones a clock wall pattern
  clone: (pattern) ->
    newPattern = CommonClockWallPattern.empty(pattern[0].length, pattern.length)
    for y in [0...pattern.length]
      for x in [0...pattern[0].length]
        newPattern[y][x] = HandRotationUtils.clone(pattern[y][x])

    newPattern

module.exports = ClockWallPatternUtils