Clock = require './Clock'

# Constants
# (percentage of whole clock)
SECOND_HAND_LENGTH =
  FRONT: 35
  BACK: 10

SECOND_HAND_DOT_SIZE = 3

# An analog clock that shows the time using the second, minute, and hour hand
class AnalogClock extends Clock
  constructor: (@$el) ->
    @$secondHand = $el.find '.second.hand'
    @$secondHandLine = @$secondHand.find '.line'
    @$frontDot = $el.find '.front.dot'
    @$backDot = $el.find '.back.dot'

    # ## Set default DOM attrs
    # ### Dots at the ends of the second hand
    @$frontDot.attr 'r', SECOND_HAND_DOT_SIZE
    @$backDot.attr 'r', SECOND_HAND_DOT_SIZE

    super(@$el)

  # Sets the rotation of the hands
  # [hour_hand_rotation, minute_hand_rotation, second_hand_rotation]
  #
  # Ex.
  # rotations = [90, 180, 270]
  # rotations = [90, 180]
  setHands: (rotations) ->
    super(rotations[0..1])

    # If the second hand is asked to be set
    if rotations.length > 2
      toRad = (deg) ->
        deg * Math.PI / 180

      getSVGRot = (rotation, length) ->
        rots =
          x: length * Math.cos(toRad rotation) + 50 + '%'
          y: length * Math.sin(toRad rotation) + 50 + '%'

      # calculate the svg equivalent rotation
      secondHandRotation =
        front: getSVGRot rotations[2], SECOND_HAND_LENGTH.FRONT
        back: getSVGRot rotations[2] + 180, SECOND_HAND_LENGTH.BACK

      # Set transform
      @$secondHandLine.attr
        x1: secondHandRotation.front.x
        y1: secondHandRotation.front.y
        x2: secondHandRotation.back.x
        y2: secondHandRotation.back.y

      @$frontDot.attr
        x1: secondHandRotation.front.x
        y1: secondHandRotation.front.y
      @$backDot.attr
        x1: secondHandRotation.back.x
        y1: secondHandRotation.back.y


module.exports = AnalogClock