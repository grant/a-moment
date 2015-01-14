Frame = require './Frame'
TimeClockWallPattern = require '../TimeClockWallPattern'

# The current year
class FrameBetter extends Frame
  getPatterns: ->
    width = Frame.DEFAULT_WIDTH
    height = Frame.DEFAULT_HEIGHT

    year = new Date().getFullYear()
    firstTwoNumbers = Math.floor(year / 100)
    lastTwoNumbers = year % 100
    timePattern = new TimeClockWallPattern(width, height)
    timePattern.setTime(firstTwoNumbers, lastTwoNumbers)
    hands = timePattern.getHandPositions()

    hands

module.exports = FrameBetter