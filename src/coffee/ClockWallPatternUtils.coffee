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

module.exports = ClockWallPatternUtils