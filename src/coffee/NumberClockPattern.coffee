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
    "│└│"
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
  NumberClockWallPattern[number] = []
  for string, i in strings
    NumberClockWallPattern[number][i] = []
    for char in string
      switch char
        when "│" then hands = [90, 270]
        when "─" then hands = [0, 180]
        when "┌" then hands = [0, 90]
        when "└" then hands = [0, 270]
        when "┐" then hands = [90, 180]
        when "┘" then hands = [180, 270]
      NumberClockWallPattern[number][i].push(hands)

module.exports = NumberClockWallPattern