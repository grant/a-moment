HandRotationUtils = require './HandRotationUtils'

# 3x7 number patterns
NumberClockWallPatternDesign =
  0: [
    "┌─┐"
    "│││"
    "│││"
    "│││"
    "│││"
    "└─┘"
  ]

  1: [
    "┌─┐"
    "└┐│"
    "─││"
    "─││"
    "─││"
    "─└┘"
  ]

  2: [
    "┌─┐"
    "└┐│"
    "┌┘│"
    "│┌┘"
    "│└┐"
    "└─┘"
  ]

  3: [
    "┌─┐"
    "└┐│"
    "┌┘│"
    "└┐│"
    "┌┘│"
    "└─┘"
  ]

  4: [
    "┌┐┐"
    "│││"
    "│`│"
    "└┐│"
    "─││"
    "─└┘"
  ]

  5: [
    "┌─┐"
    "│┌┘"
    "│└┐"
    "└┐│"
    "┌┘│"
    "└─┘"
  ]

  6: [
    "┌─┐"
    "│┌┘"
    "│└┐"
    "│││"
    "│││"
    "└─┘"
  ]

  7: [
    "┌─┐"
    "└┐│"
    "┌┘│"
    "│┌┘"
    "││─"
    "└┘─"
  ]

  8: [
    "┌─┐"
    "│││"
    "└─┐"
    "│││"
    "│││"
    "└─┘"
  ]

  9: [
    "┌─┐"
    "│││"
    "│││"
    "└┐│"
    "┌┘│"
    "└─┘"
  ]

# Convert design to hand posotions
NumberClockWallPattern = {}
for number, strings of NumberClockWallPatternDesign
  NumberClockWallPattern[number] = HandRotationUtils.toHandRotation(strings)

module.exports = NumberClockWallPattern