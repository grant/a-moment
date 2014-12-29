# Converts characters to hand rotations
# Ex:
# '-' converts to [0,180]
getHandRotation = (char) ->
  switch char
    when '│' then hands = [90, 270]
    when '─' then hands = [0, 180]
    when '┌' then hands = [0, 90]
    when '└' then hands = [0, 270]
    when '┐' then hands = [90, 180]
    when '┘' then hands = [180, 270]
    when '`' then hands = [270, 270]
    when '.' then hands = [90, 90]
    when '\\' then hands = [45, 225]
    when '/' then hands = [135, 315]

  hands


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
      getHandRotation(stringPattern)

    handRotations = []
    for string, i in stringPattern
      handRotations[i] = []
      for char in string
        hands = getHandRotation(char)
        handRotations[i].push(hands)

    handRotations

module.exports = HandRotationUtils