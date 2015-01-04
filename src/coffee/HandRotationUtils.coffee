# Converts characters to hand rotations
# Ex:
# '-' converts to [0,180]
getHandRotation = (char) ->
  circleCurvature = 20
  vCurvature = 20
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
    '◢': [135, 315]
    '◣': [45, 225]
    '◤': [135, 315]
    '◥': [45, 225]
    # Short 45 degree angles
    '◸': [315, 315]
    '◹': [45, 45]
    '◺': [225, 225]
    '◿': [135, 135]
    '◜': [90 + circleCurvature, 0 - circleCurvature]
    '◝': [180 + circleCurvature, 90 - circleCurvature]
    '◞': [270 + circleCurvature, 180 - circleCurvature]
    '◟': [0 + circleCurvature, 270 - circleCurvature]
    'v': [0 - vCurvature, 180 + vCurvature]
    '^': [0 + vCurvature, 180 - vCurvature]
    '>': [90 + vCurvature, 270 - vCurvature]
    '<': [90 - vCurvature, 270 + vCurvature]
    # Weird mappings
    # Horizontal to 45 degrees
    '◰': [0, 135]
    '◱': [0, 225]
    '◲': [180, 315]
    '◳': [45, 180]
    # Vertical to 45 degrees
    '◴': [90, 315]
    '◵': [45, 270]
    '◶': [135, 270]
    '◷': [90, 225]

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