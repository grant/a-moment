# Converts characters to hand rotations
# Ex:
# '-' converts to [0,180]
getHandRotation = (char) ->
  mapping =
    '│': [90, 270]
    '|': [90, 270]
    '─': [0, 180]
    '-': [0, 180]
    '┌': [0, 90]
    '└': [0, 270]
    '┐': [90, 180]
    '┘': [180, 270]
    '`': [270, 270]
    '.': [90, 90]
    '\\': [45, 225]
    '/': [135, 315]

  mapping[char] || throw new Error('Unknown character: ' + char)


# Utility functions for clock hands
HandRotationUtils =
  # Converts string/ASCII hand rotations to actual hand rotations (angles)
  # Ex:
  # [
  #   "┌─┐"
  #   "│││"
  #   "│││"
  #   "└┐│"
  #   "┌┘│"
  #   "└─┘"
  # ]
  #
  # will convert to:
  #
  # [
  #   [[0,90],[0,180],[90,180]],
  #   [[90,270],[90,270],[90,270]],
  #   [[90,270],[90,270],[90,270]],
  #   [[0,270],[90,180],[90,270]],
  #   [[0,90],[180,270],[90,270]],
  #   [[0,270],[0,180],[180,270]]
  # ]
  #
  # Also converts characters to their hand rotations
  # Ex:
  # '-' converts to [0,180]
  toHandRotation: (stringPattern) ->
    # If the pattern is just a character
    if typeof stringPattern == 'string'
      return getHandRotation(stringPattern)

    handRotations = []
    for string, i in stringPattern
      handRotations[i] = []
      for char in string
        hands = getHandRotation(char)
        handRotations[i].push(hands)

    handRotations

  # Converts an angle to hand rotatiosn that make the hands parallel to this angle
  # @param radians An angle in radians
  angleToHandRotation: (radians) ->
    deg = radians * (180 / Math.PI)
    [deg, (deg + 180) % 360]

module.exports = HandRotationUtils