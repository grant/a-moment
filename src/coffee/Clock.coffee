# A single clock element
class Clock
  constructor: (@$el) ->
    $hands = $el.find '.hand'
    @$minuteHand = $hands.eq(0)
    @$hourHand = $hands.eq(1)

    # ## Set default DOM attrs
    # ### Hands
    @$minuteHand.attr
      x1: '50%'
      y1: '50%'
    @$hourHand.attr
      x1: '50%'
      y1: '50%'
    @setHands([0, 0])

    # ### Axle
    $axle = $el.find '.axle'
    $axle.attr
      cx: '50%'
      cy: '50%'
      r: '4%'

    # ### Border
    $border = $el.find '.border'
    $border.attr
      cx: '50%'
      cy: '50%'
      r: '45%'

    # ### Face
    $face = $el.find '.face'
    $face.attr
      cx: '50%'
      cy: '50%'
      r: '40%'

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
    minuteHandRotation = getSVGRot rotations[0]
    hourHandRotation = getSVGRot rotations[1]

    # Set transform
    @$minuteHand.attr('x2', minuteHandRotation.x)
    @$minuteHand.attr('y2', minuteHandRotation.y)
    @$hourHand.attr('x2', hourHandRotation.x)
    @$hourHand.attr('y2', hourHandRotation.y)

module.exports = Clock