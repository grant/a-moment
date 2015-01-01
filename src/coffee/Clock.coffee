# A single clock element
class Clock
  constructor: (@x, @y, @$el) ->
    $hands = $el.find '.hand'
    @$hand1 = $hands.eq(0)
    @$hand2 = $hands.eq(1)
    @hand1Rotation = 0
    @hand2Rotation = 0

  # Sets the rotation of the hands
  # Guarantees the hands will rotate using the minimum distance
  setHands: (rotations) ->

    toRad = (deg) ->
      deg * Math.PI / 180

    handLength = 45
    getSVGRot = (rotation) ->
      rots =
        x: handLength * Math.cos(toRad rotation) + 50 + '%'
        y: handLength * Math.sin(toRad rotation) + 50 + '%'

    # calculate the svg equivalent rotation
    rotation1 = getSVGRot rotations[0]
    rotation2 = getSVGRot rotations[1]

    # Set transform
    @$hand1.attr('x2', rotation1.x)
    @$hand1.attr('y2', rotation1.y)
    @$hand2.attr('x2', rotation2.x)
    @$hand2.attr('y2', rotation2.y)

module.exports = Clock