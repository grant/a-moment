Frame = require './Frame'
CommonClockWallPattern = require '../CommonClockWallPattern'
HandRotationUtils = require '../HandRotationUtils'

# A 7x7 star shaped pattern
class FrameMoment extends Frame
  getPatterns: ->
    width = Frame.DEFAULT_WIDTH
    height = Frame.DEFAULT_HEIGHT

    # Default background is horizontal
    hands = CommonClockWallPattern.horizontal(width, height)

    # Make the middle 7x7 a star
    starSize = 7
    starRadius = Math.floor(starSize / 2)
    middle =
      x: Math.floor(width / 2)
      y: Math.floor(height / 2)
    start =
      x: middle.x - starRadius
      y: middle.y - starRadius
    end =
      x: middle.x + starRadius
      y: middle.y + starRadius

    for y in [start.y..end.y]
      for x in [start.x..end.x]
        console.log x
        xDiff = x - middle.x
        yDiff = y - middle.y
        if !(x == middle.x and y == middle.y)
          angle = Math.atan2(yDiff, xDiff)
          hands[y][x] = HandRotationUtils.angleToHandRotation(angle)

    # Make the very middle clock horizontal
    hands[middle.y][middle.x] = HandRotationUtils.toHandRotation('-')

    hands

module.exports = FrameMoment