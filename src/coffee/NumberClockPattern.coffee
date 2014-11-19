# 3x7 number patterns
NumberClockPatternDesign =
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
NumberClockPattern = {}
for number, strings of NumberClockPatternDesign
  NumberClockPattern[number] = []
  for string, i in strings
    NumberClockPattern[number][i] = []
    for char in string
      switch char
        when "│" then hands = [90, 270]
        when "─" then hands = [0, 180]
        when "┌" then hands = [0, 90]
        when "└" then hands = [0, 270]
        when "┐" then hands = [90, 180]
        when "┘" then hands = [180, 270]
      NumberClockPattern[number][i].push(hands)

console.log NumberClockPattern

module.exports = NumberClockPattern